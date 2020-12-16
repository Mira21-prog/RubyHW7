class Author < ApplicationRecord
  has_many :posts

  def full_name
  	"#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end
