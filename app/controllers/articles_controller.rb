class ArticlesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article)
      flash[:notice] = '⚪︎保存出来ました。'
    else
      flash.now[:error] = '⚪︎ﾀｲﾄﾙは2字以上20字以内、内容3字以上入力して下さい。'
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if  @article.update(article_params)
      redirect_to article_path(@article)
      flash[:notice] = '⚪︎更新出来ました。'
    else
      flash.now[:error] = '⚪︎更新出来ませんでした。'
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path
    flash[:notice] = '⚪︎削除出来ました。'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
