class AdminController < ApplicationController

  before_filter :authenticate
  before_filter :admin_user

  def index
    @posts = Post.order(:name).includes(:posts)
  end
  def admin

  end

  def admin_user
    redirect_to(:back) unless current_user.admin?
  end
end
