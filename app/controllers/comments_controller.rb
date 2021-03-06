class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comment.build(comment_params)
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
