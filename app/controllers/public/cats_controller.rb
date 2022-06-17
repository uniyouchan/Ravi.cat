class Public::CatsController < ApplicationController

  def index
    @customer = Customer.find(current_user.id)
    @cat = Cat.new
    @Cats = Cat.all
  end

  def create
    @customer = Customer.find(current_customer.id)
    @cat = Cat.new(cat_params)
    @cat.customer_id current_customer.id
    @cats = Cat.all
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :index
    end
  end

  def show
    @cat = Cat.new
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cats_path
  end

  def cat_params
    params.require(:cat).permit(:cat_image, :name, :pattern, :introduction, :age, :gender, :exam, :area, :cost, :neuter, :vaccination, :from)
  end

end
