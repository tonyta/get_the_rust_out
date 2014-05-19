class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{user.name}!"
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = "Incorrect email and/or password."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

    def already_signed_in
      redirect_to(root_url) unless current_user.nil?
    end
end
