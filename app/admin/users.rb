# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :name, :lastname, :address, :postal_code, :province_id, :province
end
