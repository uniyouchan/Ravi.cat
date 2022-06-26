class Admin::CatsController < ApplicationController
  before_action :authenticate_admin!
 def index
   @cat = Cat.new
   @cats = Cat.order(id: :DESC).page(params[:page]).per(3)
 end

end
