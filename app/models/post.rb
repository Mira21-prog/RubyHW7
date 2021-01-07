class Post < ApplicationRecord
  is_impressionable

  has_one_attached :image

  belongs_to :author
  has_many :comments, dependent: :destroy

  has_many :author_comment_votes, through: :comments, dependent: :destroy

  validates :title, :content, :image, presence: true
  validates :title, :content, length: { maximum: 200 }
  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end
end
