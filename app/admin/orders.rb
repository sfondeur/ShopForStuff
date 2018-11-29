# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :first_name, :last_name, :subtotal, :status, :pst, :gst, :hst, :user_id
end
