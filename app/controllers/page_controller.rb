class PageController < ApplicationController

  def index
    @title = "index"
    @posts= Post.last(10)
    @posts = Post.desc
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