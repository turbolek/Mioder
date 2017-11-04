class Product < ActiveRecord::Base
  has_many :order_products
  
  accepts_nested_attributes_for :order_products
end
