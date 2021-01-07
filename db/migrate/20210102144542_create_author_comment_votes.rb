class CreateAuthorCommentVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :author_comment_votes do |t|
      t.references :author
      t.references :comment
      t.integer :vote_value
    end
  end
end
