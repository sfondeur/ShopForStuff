# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :lastname, :address, :postal_code, :province_id,
                                 :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :lastname, :email, :address, :postal_code, :province_id,
                                 :password, :password_confirmation, :current_password)
  end
end
