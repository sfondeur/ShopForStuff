# frozen_string_literal: true

ActiveAdmin.register ProductCategory do
  permit_params :product_id, :category_id
end
