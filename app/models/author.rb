class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
  	"#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end