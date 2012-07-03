class Contractor < ActiveRecord::Base
  attr_accessible :email, :jobtype, :location, :name
  has_many :quotations
end
