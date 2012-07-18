module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
    session[:user_id] = user.id
    end

def current_user=(user)
  @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def signed_in?
    !current_user.nil?
  end

  def sign_out

    self.current_user = nil
    session[:cart_id] = nil
    cookies.delete(:remember_token)
    #session[:user_id]=nil

  end
end
