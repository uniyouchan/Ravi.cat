class Public::CatsController < ApplicationController

  def new
   @cat = Cat.new
  end

  def create
   @cat = Cat.new(cat_params)
   @cat.customer_id = current_customer.id
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :index
    end
  end

  def index
   @customer = Customer.find(current_customer.id)
   @cat = Cat.new
   @cats = Cat.all
  end

  def show
   @detail = Cat.find(params[:id])
  end

  def edit
   @cat = Cat.find(params[:id])
    #if @cat.customer == current_customer
      #render :edit
    #else
      #redirect_to cats_path
    #end
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
