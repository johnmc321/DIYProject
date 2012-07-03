
class ContractorsController < ApplicationController


 def new
   @contractor = Contractor.new

  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def create
    @contractor = Contractor.new(params[:contractor])
    if @contractor.save
      redirect_to root_path
    else
      render 'new'


    end
  end
end
