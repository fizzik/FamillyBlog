class SessionsController < ApplicationController
  def new
    @total_users = User.count
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    respond_to do |format|
      if user.nil?
        format.html {redirect_to (:back), :notice => 'Invalid email/password combination.' }
      else
        format.html {sign_in user}
        redirect_to user
      end

    end
  end

  def destroy
    sign_out
    redirect_to posts_path
  end
end