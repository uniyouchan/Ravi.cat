# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     root_path(resource)
   end

    def after_sign_up_path_for(resource)
     customer_path(resource)
    end

   def after_sign_out_path_for(resource)
     root_path
   end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :family_name, :first_name_kana, :family_name_kana, :postal_code, :address, :telephone_number, :email])
    end


end
