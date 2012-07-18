class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
<<<<<<< HEAD

=======
>>>>>>> 207accfc3eec206cb72f8e33563f4c4870b03218

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
