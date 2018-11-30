# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all
ProductCategory.destroy_all

Category.create(title: 'Electronics')
Category.create(title: 'Furniture')
Category.create(title: 'Miscellaneous')

elec = Category.find_by(title: 'Electronics')
furn = Category.find_by(title: 'Furniture')
misc = Category.find_by(title: 'Miscellaneous')

elec.products.create title: 'Xbox One X', description: 'Plays your Xbox games in 4K and 60fps', price: 499.99
elec.products.create title: 'Xbox One S', description: 'Slightly better than the original', price: 399.99
elec.products.create title: 'Playstation 4', description: 'Original PS4', price: 399.99
elec.products.create title: 'Playstation 4 Pro', description: 'Plays PS games in 60 fps', price: 499.99
elec.products.create title: 'Nintendo Switch', description: 'Plays Nintendo games', price: 449.99

furn.products.create title: 'Damacio Recliner', description: 'Leather reclining chair', price: 899.99
furn.products.create title: 'Chamberley Sectional', description: 'Grey fabric Sectional', price: 1699.99
furn.products.create title: 'TV Stand', description: 'Tv stand for your media related items', price: 199.99

puts "Number of Categories created: #{Category.count}"
puts "Number of Products created: #{Product.count}"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# faker commerce stuff
# For unique values only
# Faker::Name.unique.name
# Faker::Commerce.color #=> "lavender"

# Optional arguments max=3, fixed_amount=false
# Faker::Commerce.department #=> "Grocery, Health & Beauty"
# Faker::Commerce.department(5) #=> "Grocery, Books, Health & Beauty"
# Faker::Commerce.department(2, true) #=> "Books & Tools"

# Faker::Commerce.material #=> "Steel"

# Faker::Commerce.product_name #=> "Practical Granite Shirt"

# Produces a Float by default
# Faker::Commerce.price #=> 44.6
# Faker::Commerce.price(range = 0..10.0, as_string = true) #=> "2.18"

# Generate a random promotion code.
# Optional argument digits = 6 for number of random digits in suffix
# Faker::Commerce.promotion_code #=> "AmazingDeal829102"
# Faker::Commerce.promotion_code(digits = 2) #=> "AmazingPrice57"

# Faker::Commerce.material #=> "Plastic"
