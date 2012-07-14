class Category < ActiveRecord::Base
  attr_accessible :name, :category_id, :category_name
  has_many :products
end
