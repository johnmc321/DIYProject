
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @quotation = Quotation.find(:all, :conditions => {:user_id => current_user.id})


    end


  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
       redirect_to root_path
    else
       render 'new'

    end
  end

end
