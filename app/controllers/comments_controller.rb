class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if params[:comment][:parent_id].to_i > 0
      @comment = @article.comments.create(comment_params)
      flash[:success] = 'Your comment was successfully added.'
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :parent_id)
    end
end
