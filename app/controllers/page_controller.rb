class PageController < ApplicationController


  def index

    @posts = Post.desc.paginate(:page => params[:page],  :per_page => 5)

    @total_users = User.count

  end

  def services
    @title = "services"
    @posts = Post.search(params[:search])
    @posts = Post.desc.last(10)


  end

  def help
    @title = "help"
    @posts = Post.search(params[:search])
    @posts = Post.desc.last(10)


  end

  def about
    @posts = Post.search(params[:search])
    @posts = Post.desc.last(10)

  end


end