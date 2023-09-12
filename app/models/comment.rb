# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 1 }

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end
end
