class Admin::CommentsController < ApplicationController

 def destroy
  Comment.find(params[:id]).destroy
  redirect_to cat_path(params[:cat_id])
 end

 private

 def comment_params
  params.require(:comment).permit(:cat_comment)
 end

end
