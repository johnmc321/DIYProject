
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      reset_session
      sign_in(user)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
  end
end
  def destroy
    sign_out
    reset_session
    redirect_to root_path
  end

end
