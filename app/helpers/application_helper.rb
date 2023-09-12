module ApplicationHelper
  def resource_name
    :user
  end

  def article_actions_dropdown(article)
    if user_signed_in? && current_user.has_written?(article)
      render 'commons/article_actions_dropdown', article: article
    end
  end
end
