class Product < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :description, :image_url, :price, :title, :category, :category_id, :category_name
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)$}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, length: {minimum: 3}
  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

#
# Date: 14.07.12
# @author John McCormack x12100323
# @reference http://stackoverflow.com/questions/5422489/search-multiple-db-columns-in-rails-3-0
  def self.search(search_query)
    if search_query
      find(:all,:conditions => ['title LIKE :search_query OR description LIKE :search_query', {:search_query => "%#{
      search_query}%"}])
    else
      find(:all)
    end
  end
end
