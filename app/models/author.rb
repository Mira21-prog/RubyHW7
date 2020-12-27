class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save { email.downcase! }
  validates :password, presence: true, length: { minimum: 8 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 8},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  def full_name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end 
