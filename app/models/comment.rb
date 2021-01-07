class Comment < ApplicationRecord
	has_many :author_comment_votes, dependent: :destroy
  belongs_to :post, counter_cache: true
  belongs_to :author

  has_ancestry

  enum status: { unpublished: 0, published: 1 }

  validates :body, presence: true

end
