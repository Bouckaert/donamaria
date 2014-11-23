class RevenuesController < ApplicationController
  def index
    @revenues = Revenue.page(params[:page]).per(10)
  end

  def import
    Revenue.import
    redirect_to revenues_path
  end

  private
    def set_receita
      @revenue = Revenue.find(params[:id])
    end

    def receita_params
      params.require(:revenue).permit(:sequencial_candidato, :receipt_title, :donator, :price, :description)
    end
end
