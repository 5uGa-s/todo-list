class CommentsController < ApplicationController
  before_action :find_article, only: [:new, :create, :edit, :update]

  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
    unless user_signed_in?
      flash[:error] = '⚪︎コメントを投稿するにはログインしてください。'
      redirect_to new_user_session_path
    end
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = '⚪︎コメント出来ました。'
      redirect_to article_path(article)
    else
      flash.now[:error] = '⚪コメント出来ませんでした。'
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end  

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = '⚪︎コメントを更新しました。'
      redirect_to article_path(@article)
    else
      flash.now[:error] = '⚪更新が出来ませんでした。'
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = '⚪コメントが削除されました。'
    redirect_to @comment.article
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end  
end