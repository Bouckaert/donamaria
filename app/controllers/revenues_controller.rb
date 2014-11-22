class ReceitasController < ApplicationController
  def index
    @receitas = Receita.page(params[:page]).per(10)
  end

  def import
    Receita.import
    redirect_to receitas_path
  end

  private
    def set_receita
      @receita = Receita.find(params[:id])
    end

    def receita_params
      params.require(:receita).permit(:sequencial_candidato, :numero_recibo_eleitoral, :nome_doador, :valor_receita, :descricao_da_receita)
    end
end
