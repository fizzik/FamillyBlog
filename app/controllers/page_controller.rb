class PageController < ApplicationController

  def index
    @title = "index"
    @posts = Post.order(:title)
    @posts= Post.last(7)
  end

  def contact
    @title = "contact"

  end

  def help
    @title = "help"

  end

  def about
    @title = "about"

  end

end
