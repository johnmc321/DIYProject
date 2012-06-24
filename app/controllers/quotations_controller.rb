
class QuotationsController < ApplicationController
  def new
   @quotation = Quotation.new
  end
  def show
    @quotation = Quotation.find(params[:id])

  end

  def create
   # @quotation = Quotation.new(params[:quotation])
    @quotation = current_user.quotations.build(params[:quotation])
    if @quotation.save
      redirect_to root_path
    else
      render 'new'

    end
  end
end
