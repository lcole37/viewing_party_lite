class UsersController < ApplicationController
  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
      flash[:error] = "Must be registered and logged in"
    end
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    elsif params[:password] != params[:password_confirmation]
      redirect_to register_path
      flash[:alert] = "Error: Password and confirmation must match"
    else
      flash[:alert] = "Error: Email already linked with an account"
      redirect_to register_path
    end
  end

  def login_form

  end

  def login_user
    # require "pry"; binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
      flash[:alert] = "Bad credentials"
    end
  end

  def logout_user
    session.delete :user_id
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
