class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories
    
    accepts_nested_attributes_for :product_categories, allow_destroy: true

    validates :title, :price, presence: true
end

#  ProductCategory.first.product.title => Grabs the first ProductCategory (1, which is Electronics) then grabs the Products title (Xbox)

# To create a product under electronics category..
# elec = Category.find_by(title: 'Electronics')
# elec.products.create title:'Xbox One X', description: 'Play Xbox games on this console', price: 499.99