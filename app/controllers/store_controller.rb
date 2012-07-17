
class StoreController < ApplicationController
  def index   #gets products & displays them
    @products = Product.search(params[:search_query])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
