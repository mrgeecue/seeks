class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = "Creation Error"
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    end

  def update
     @user = User.find(params[:id])
     if @user.update(name: params[:user][:name], email: params[:user][:email])
       redirect_to "/users/#{@user.id}"
     else
       flash[:errors] = "you got it wrong"
       redirect_to "/users/#{@user.id}"
     end
  end

  def show
    @user = User.all
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :password)
  end
end
