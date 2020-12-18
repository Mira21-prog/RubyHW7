class Post < ApplicationRecord
  belongs_to :author 
  has_many :comments, dependent: :destroy
  validates :image, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { maximum: 200 }
  validates :content, length: { maximum: 700 }
end
