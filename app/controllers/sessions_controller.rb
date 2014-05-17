class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{user.name}!"
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Incorrect email and/or password."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end