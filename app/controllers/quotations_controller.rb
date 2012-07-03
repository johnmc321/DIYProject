
class QuotationsController < ApplicationController
  def new
   @quotation = Quotation.new
  end
  def show
    @quotation = Quotation.find(params[:id])

  end

  def create

    @quotation = current_user.quotations.build(params[:quotation])
    @contractor = Contractor.find(:all)
       @contractor.each do |i|
    if((i.jobtype == @quotation.jobtype) && (i.location == @quotation.location))
        @quotation.contractor_id = i.id
    end
    end
    if @quotation.save
      redirect_to root_path
    else
      render 'new'

    end
  end
end
