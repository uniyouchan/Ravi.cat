class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cats = @customer.cats.order(id: :DESC).page(params[:page]).per(5)
    @favorites = Favorite.where(customer_id: current_customer.id).order(id: :DESC).page(params[:page]).per(5)
    @current_entry = Entry.where(customer_id: current_customer.id)
    @another_entry = Entry.where(customer_id: @customer.id)
    unless @customer.id == current_customer.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
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
