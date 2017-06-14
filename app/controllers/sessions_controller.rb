class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:session][:email])
      session[:user_id] = @user.id
      flash[:success] = "logged in"
      redirect_to @user
    else
      flash[:info] = 'didnt log in!'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
  end


end
