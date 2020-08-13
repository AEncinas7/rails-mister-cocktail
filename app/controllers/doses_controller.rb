class DosesController < ApplicationController
  def create
    # {"dose"=>{"description"=>"Bla bla", "ingredient_id"=>"401"}, "cocktail_id"=>"11"}
    @dose = Dose.create(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    # PARAMS: {"id"=>"11"}
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
