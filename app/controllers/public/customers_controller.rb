class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cats = @customer.cats.order(id: :DESC).page(params[:page]).per(5)
    @favorites = Favorite.where(customer_id: current_customer.id).order(id: :DESC).page(params[:page]).per(5)
    @currentCustomerEntry = Entry.where(customer_id: current_customer.id)
    @customerEntry = Entry.where(customer_id: @customer.id)
    unless @customer.id == current_customer.id
      @currentCustomerEntry.each do |current|
        @customerEntry.each do |customer|
          if current.room_id == customer.room_id then
            @IsRoom = true
            @roomId = current.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
