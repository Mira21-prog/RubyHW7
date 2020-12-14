class Post < ApplicationRecord
    belongs_to :author
    validates :image, format: { with: URI::regexp(%w(http https))}
end
