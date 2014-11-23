class PatrimoniesController < ApplicationController
  def index
    @patrimonies = Patrimony.page(params[:page]).per(10)
  end

  def import
    Patrimony.import
    redirect_to patrimonies_path
  end

  private
  def patrimonio_params
    params.require(:patrimony).permit(:sequencial_candidato, :description, :price)
  end

end
