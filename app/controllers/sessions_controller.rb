class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email( params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = "Incorrect Email or Password"
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
