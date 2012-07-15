
class StoreController < ApplicationController
  def index
    @products = Product.search(params[:search_query])
  end
end
