class Admin::CustomersController < ApplicationController
 before_action :authenticate_admin!

 def show
  @customer = Customer.find(params[:id])
  @cats = @customer.cats.page(params[:page])
 end

 def index
  @customers = Customer.page(params[:page]).per(5)
 end

 def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
   redirect_to admin_customers_path
 end

 private

 def customer_params
  params.require(:customer).permit(:name)
 end

 def admin_customer
  remember_token = Customer.encrypt(cookies[:remember_token])
  current_customer ||= customer.find_by(remember_token: remember_token)
  render status: :unanthorized unless current_customer.admin?
 end


end
