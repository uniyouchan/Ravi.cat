class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cats = @customer.cats.page(params[:page])
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
