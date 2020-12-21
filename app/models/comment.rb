class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  enum status: { unpublished: 0, published: 1 }
end
