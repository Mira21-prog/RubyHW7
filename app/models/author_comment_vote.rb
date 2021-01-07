class AuthorCommentVote < ApplicationRecord
  enum vote_value: %i[upvote downvote]
  belongs_to :author
  belongs_to :comment
end
