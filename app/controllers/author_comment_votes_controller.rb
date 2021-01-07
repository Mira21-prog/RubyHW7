class AuthorCommentVotesController < ApplicationController

	def create
		vote = AuthorCommentVote.new(vote_params)
		if vote.save
			upvotes_count = AuthorCommentVote.where(comment_id: params[:vote][:comment_id], vote_value: 'upvote').count
			downvotes_count = AuthorCommentVote.where(comment_id: params[:vote][:comment_id], vote_value: 'downvote').count
			render json: { upvotes_count: upvotes_count, downvotes_count: downvotes_count }, status: 200
		else 
		end

	end

	private

	def vote_params
     params.require(:vote).permit(:author_id, :comment_id, :vote_value)
  end

end