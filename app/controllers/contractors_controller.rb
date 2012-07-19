
class ContractorsController < ApplicationController
#@author Enda McDonagh X12100871
#@ref Ruby on Rails Tutorial - Michael Hartl
 def new

   @contractor = Contractor.new
  end

  def show
    @contractor = Contractor.find(:all)
  end

  def create
    @contractor = Contractor.new(params[:contractor])
    if@contractor.save
     redirect_to root_path

     else
       render 'new'
     end
  end

 def edit
   @contractor=Contractor.find(params[:id])
 end

 def update
   @contractor = Contractor.find(params[:id])
   if @contractor.update_attributes(params[:contractor])
     flash[:success] = "Contractor Updated"
     redirect_to display_all_path
   else
     render 'edit'
   end
 end



  def destroy
      @contractor = Contractor.find(params[:id])
        @contractor.destroy

        respond_to do |format|
          format.html { redirect_to display_all_path}
          format.json { head :no_content }
        end
   end


end
