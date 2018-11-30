# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :title, :description, :price, :image, :picture, :manufacturer,
                product_categories_attributes: %i[id product_id category_id _destroy]

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :price
    column :image
    column :picture
    column :manufacturer
    column :categories do |product|
      product.categories.map(&:title).join(', ').html_safe
    end
    actions
  end

  show do |_product|
    attributes_table do
      row :title
      row :description
      row :price
      row :image
      row :picture
      row :manufacturer
      row :categories do |product|
        product.categories.map(&:title).join(', ').html_safe
      end
    end
  end

  form do |f|
    # if i have a validation error, display the errors in form
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Product' do
      f.input :title
      f.input :description
      f.input :price
      f.input :image
      f.input :picture
      f.input :manufacturer
      # adds dropdown for categories by using 'has_many'
      f.has_many :product_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end
    end

    f.actions
  end
end
