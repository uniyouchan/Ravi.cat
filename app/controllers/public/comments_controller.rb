class Public::CommentsController < ApplicationController

 def create
  cat = Cat.find(params[:cat_id])
  comment = Comment.new(comment_params)
  comment.customer_id = current_customer.id
  comment.cat_id = cat.id
  comment.save
  redirect_to cat_path(cat)
 end

 def destroy
   Comment.find(params[:id]).destroy
   redirect_to cat_path(params[:cat_id])
 end

 private

  def comment_params
   params.require(:comment).permit(:cat_comment)
  end

end
