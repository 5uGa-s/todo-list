class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path
  end
end
