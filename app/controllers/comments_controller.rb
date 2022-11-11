class CommentsController < ApplicationController
	def create

		@post = Post.find(params[:post_id])
		@post.comments.create!(author_id: current_user.id,comment_text: comment_params[:comment_text])
		redirect_to post_path(@post)
	end
	private
	def comment_params
		params.require(:comment).permit(:comment_text)
		
	end
end
