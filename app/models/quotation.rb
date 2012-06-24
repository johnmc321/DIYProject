class Quotation < ActiveRecord::Base
  attr_accessible :name, :email, :location, :description, :jobtype
  belongs_to :user
 validates :description, presence: true, length: { maximum: 200 }
 validates :user_id, presence: true
  default_scope order: 'quotations.created_at DESC'

end
