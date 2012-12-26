class AdminController < ApplicationController

  before_filter :authenticate


  def index
    @posts = Post.order(:name).includes(:posts)
  end
  def admin

  end


end
