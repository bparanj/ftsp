class ArticlesController < ApplicationController
  def index
    @articles = Article.text_search(params[:query])
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new(article_id: @article.id)
  end
    
end
