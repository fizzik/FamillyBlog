class PageController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
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
  private

  def sort_column
    Post.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end