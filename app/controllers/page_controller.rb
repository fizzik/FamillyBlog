class PageController < ApplicationController


  def index
    @posts = Post.search(params[:search])
    @posts = Post.desc.last(10)



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