class Public::CatsController < ApplicationController
  before_action :authenticate_customer!

  def new
   @cat = Cat.new
  end

  def create
   @cat = Cat.new(cat_params)
   @cat.customer_id = current_customer.id
    if @cat.save
      cat_tags = Vision.get_image_data(@cat.cat_image)
      cat_tags.each do |cat_tag|
       @cat.cat_tags.create(name: cat_tag)
      end
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def index
   @cat = Cat.new
   @cats = Cat.order(id: :DESC).page(params[:page]).per(10)

  end

  def show
   @detail = Cat.find(params[:id])
   @comment = Comment.new
   @cat = @detail
  end

  def edit
   @cat = Cat.find(params[:id])
    if @cat.customer == current_customer
      render :edit
    else
      redirect_to cats_path
    end
  end

  def update
   @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_path(@cat.id)
    else
      render :edit
    end
  end

  def destroy
   @cat = Cat.find(params[:id])
   @cat.destroy
    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:cat_image, :name, :pattern, :introduction, :age, :gender, :exam, :area, :cost, :neuter, :vaccination, :from)
  end

end
