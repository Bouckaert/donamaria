class DespesasController < ApplicationController
  def index
    @despesas = Despesa.page(params[:page]).per(10)
  end

  def import
    Despesa.import
    redirect_to despesas_path
  end

  private
  def despesa_params
    params.require(:despesa).permit(:sequencial_candidato, :nome_fornecedor, :valor_despesa, :descricao_despesa)
  end

end
