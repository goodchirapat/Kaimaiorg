class User < ApplicationRecord
    has_secure_password :validations => false
    has_many :bought_items, :class_name => 'Inventory', :foreign_key => 'buyer_id', dependent: :destroy
    has_many :sold_items, :class_name => 'Inventory', :foreign_key => 'seller_id', dependent: :destroy
end
