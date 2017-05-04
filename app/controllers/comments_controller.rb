class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(permitted_params)
    if @comment.save
      redirect_to @comment.article, notice: "Successfully created comment."
    else
      render :new
    end
  end
  
  private
  
  def permitted_params
    params.require(:comment).permit(:article_id, :article, :content, :name)
  end
end
