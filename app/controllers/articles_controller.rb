class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    set_article(@article)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '⚪︎保存出来ました。'
    else
      flash.now[:error] = '⚪︎保存出来ませんでした。'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if  @article.update(article_params)
      redirect_to article_path(@article), notice: '⚪︎更新出来ました。'
    else
      flash.now[:error] = '⚪︎更新出来ませんでした。'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '⚪︎削除しました。'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article(article)
    @current_article = article
  end

end
