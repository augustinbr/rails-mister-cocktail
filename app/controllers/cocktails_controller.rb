class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])

  end

  def new
    @cocktail = Cocktail.new

  end

  def create
    @cocktail = Cocktail.new(safe_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end


  private

  def safe_cocktail
    params.require(:cocktail).permit(:name)
  end
end
