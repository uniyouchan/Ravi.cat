class Admin::CustomersController < ApplicationController
 before_action :authenticate_admin!

 def show
  @customer = Customer.find(params[:id])
  @cats = @customer.cats.page(params[:page])
 end

 def index
  @customers = Customer.page(params[:page]).per(5)
 end

 private

  def customer_params
    params.require(:customer).permit(:name)
  end


end
