class SessionsController < ApplicationController
  def new
    @total_users = User.count
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?

    redirect_to (:back)

    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to posts_path
  end
end