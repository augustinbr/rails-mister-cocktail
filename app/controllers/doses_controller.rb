class DosesController < ApplicationController

  # /cocktails/:cocktail_id/doses/new(.:format)

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # /cocktails/:cocktail_id/doses(.:format)
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(safe_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose)
  end
end

private

def safe_dose
  params.require(:dose).permit(:description, :ingredient_id)
end
