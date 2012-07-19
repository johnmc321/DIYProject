class Category < ActiveRecord::Base
  attr_accessible :name, :category_id, :category_name
  has_many :products

  ## Date: 19.07.12
  # def to_param
  # @author John McCormack
  # @reference http://railscasts.com/episodes/314-pretty-urls-with-friendlyid
  #
  def to_param
    "#{id} #{name}".parameterize
  end
end
