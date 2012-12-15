class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back}
      else
        format.html { redirect_to :back, notice: "Field should not be empty and max 300 symbol" }
      end
    end
  end


  def index
    @total_comments = Comment.count
    @comments = Comment.desc
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
