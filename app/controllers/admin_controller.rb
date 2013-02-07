class AdminController < ApplicationController

  before_filter :authenticate


  def index

  end
  def admin
    @total_questions = Question.count
    @total_letters = Letter.count
    @total_users = User.count
    @total_posts = Post.count

  end


end
