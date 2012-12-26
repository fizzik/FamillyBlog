class PageController < ApplicationController


  def index
    @posts = Post.search(params[:search])
    @posts = Post.desc

    @posts= Post.desc.paginate(:page => params[:page], :per_page => 7)
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