class Public::GuestsController < ApplicationController
  def new_guest
   customer = Customer.find_or_create_by!(email: 'guest@example.com', name: 'guest') do |customer|
     customer.password = SecureRandom.urlsafe_base64
   end
   sign_in customer
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
