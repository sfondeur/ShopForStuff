class Order < ApplicationRecord
    # TODO: Make join table between Product and Order called 'OrderItem'
    belongs_to :order_item
end
