class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.page(params[:page]).per(10)
  end

  def import
    Expenditure.import
    redirect_to expenditures_path
  end

  private
  def expenditure_params
    params.require(:expenditure).permit(:sequencial_candidato, :seller, :price, :description)
  end

end
