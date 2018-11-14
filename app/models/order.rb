class Order < ApplicationRecord
    # TODO: Make join table between Product and Order called 'OrderItem'
    # has_many :items, class_name: 'OrderItem'

    # validates :first_name, :last_name, :subtotal, presence: true
end
