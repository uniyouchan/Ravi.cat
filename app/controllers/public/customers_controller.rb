class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cats = @customer.cats.order(id: :DESC).page(params[:page]).per(5)
    @favorites = Favorite.where(customer_id: current_customer.id).order(id: :DESC).page(params[:page]).per(5)
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
