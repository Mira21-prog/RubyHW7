class AddNameContentImageToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :name, :string
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :image, :string
  end
end
