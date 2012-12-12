class AdminController < ApplicationController
  before_filter :admin_user
  before_filter :authenticate

  def admin

  end
  def admin_user
    redirect_to(:back) unless current_user.admin?
  end
end
