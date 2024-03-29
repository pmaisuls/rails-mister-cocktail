class DosesController < ApplicationController


def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new
end


  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.cocktail_id = @cocktail.id
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

end


