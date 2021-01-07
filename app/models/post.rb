class Post < ApplicationRecord
  is_impressionable

  has_one_attached :image

  belongs_to :author
  has_many :comments, dependent: :destroy

  has_many :author_comment_votes, through: :comments
  validates :image, presence: true

  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { maximum: 200 }
  validates :content, length: { maximum: 2000 }
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
