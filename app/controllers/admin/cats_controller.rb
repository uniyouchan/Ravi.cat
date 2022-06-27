class Admin::CatsController < ApplicationController
  before_action :authenticate_admin!
def index
 @cat = Cat.new
 @cats = Cat.order(id: :DESC).page(params[:page]).per(5)
end

def show
 @detail = Cat.find(params[:id])
 @comment = Comment.new
 @cat = @detail
end

def destroy
 @cat = Cat.find(params[:id])
 @cat.destroy
  redirect_to admin_cats_path
end

end
