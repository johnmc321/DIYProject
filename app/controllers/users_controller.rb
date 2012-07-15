
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @quotation = Quotation.find(:all, :conditions => {:user_id => current_user.id})
    @order = Order.find(:all, :conditions => {:user_id =>current_user.id})

    end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to DIY or NOT"
      sign_in @user
       redirect_to root_path
    else
       render 'new'
    end
    end

    def edit
      @user=User.find(params[:id])
    end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile Updated"
        sign_in @user
        redirect_to @user
    else
      render 'edit'
    end
  end

end


