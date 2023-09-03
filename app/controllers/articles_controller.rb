class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = '⚪︎保存出来ました。'
      redirect_to article_path(@article)
    else
      flash.now[:error] = '⚪ﾀｲﾄﾙは1字以上20字以内、内容は3字以上入力して下さい。'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if  @article.update(article_params)
      flash[:notice] = '⚪︎更新出来ました。'
      redirect_to article_path(@article)
    else
      flash.now[:error] = '⚪︎更新出来ませんでした。'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    flash[:notice] = '⚪︎削除出来ました。'
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def article_params
    params.require(:article).permit(:title, :image)
  end

end
