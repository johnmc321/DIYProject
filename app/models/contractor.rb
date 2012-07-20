class Contractor < ActiveRecord::Base
  #@author Enda McDonagh X12100871
  #@Ref Ruby on Rails Tutorial by Michael Hartl
  attr_accessible :email, :jobtype, :location, :name
  has_many :quotations
  validate :checked_location
  validate :checked_skill
  validates :email, presence: true, length: { minimum: 1 }
  validates :jobtype, presence: true, length: { minimum: 1 }
  validates :location, presence: true, length:{minimum: 1}
  validates :name, presence: true, length: { minimum: 1 }

  def checked_location
   if location == "Select One"
      errors.add(:location, "You must select a County")
   end
  def checked_skill
    if jobtype == "Select One"
      errors.add(:jobtype, "You must select a Skill")
    end

  end
    end



end
