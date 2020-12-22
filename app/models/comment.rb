class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author

  enum status: { unpublished: 0, published: 1 }

  validates :body, presence: true
end
