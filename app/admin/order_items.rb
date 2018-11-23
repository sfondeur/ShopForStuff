# frozen_string_literal: true

ActiveAdmin.register OrderItem do
  permit_params :order_id, :product_id
end
