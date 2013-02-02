class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def create
    @total_users = User.count
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back}
        format.js
      else
        format.html { redirect_to :back, :notice => "Field should not be empty and max 300 symbol" }
      end
    end
  end
  def vote
    value = params[:type] == "up" ? +1 : -1
    value = params[:type] == "down" ?  -1  : 1
    @comment = Comment.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back
  end


  def index
    @comments = Comment.desc.last(5)
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
