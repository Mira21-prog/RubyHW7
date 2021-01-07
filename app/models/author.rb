class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  before_save { email.downcase! }
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :avatar, presence: true
  validates :first_name, presence: true

  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 8},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password


  def full_name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end

  def has_vote?(comment)
    AuthorCommentVote.where(author: self, comment: comment).any?
  end
end 
