class Public::RoomsController < ApplicationController
  before_action :authenticate_customer!

  def create
    room = Room.create
    current_entry = Entry.create(customer_id: current_customer.id, room_id: room.id)
    another_entry = Entry.create(customer_id: params[:entry][:customer_id], room_id: room.id)
    redirect_to room_path(room)
  end

  def index
    current_entries = current_customer.entries
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_id).where.not(customer_id: current_customer.id)
  end


  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(customer_id: current_customer.id).first
  end
end