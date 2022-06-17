class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end
  
  def edit
  end
  
  def update
    if @customer.update(customer_params)
      flash[:nitice] = "更新しました"
      render_to customer_path(@customer)
    else
      render :edit
    end
  end
  

  private

  def customer_params
    params.require(:customer).permit(:first_name, :family_name, :farst_name_kana, :family_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
