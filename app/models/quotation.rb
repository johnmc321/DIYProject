class Quotation < ActiveRecord::Base
  #@Author Enda McDonagh X12100871
  #@ref Ruby on Rails Tutorial by Michael Hartl
  attr_accessible :name, :email, :location, :description, :jobtype
  belongs_to :user
  belongs_to :contractor
  validate :checked_location
  validate :checked_skill

 validates :description, presence: true, length: { maximum: 200 }
 validates :user_id, presence: true
  default_scope order: 'quotations.created_at DESC'

  def checked_location
    if location == "Select One"
      errors.add(:location, "You must select a County")
    end
  end

  def checked_skill
    if jobtype == "Select One"
      errors.add(:location, "You must select a Skill")
    end
  end


end
