class PatrimoniosController < ApplicationController
  def index
    @patrimonios = Patrimonio.page(params[:page]).per(10)
  end

  def import
    Patrimonio.import
    redirect_to patrimonios_path
  end

  private
  def patrimonio_params
    params.require(:patrimonio).permit(:sequencial_candidato, :detalhe_bem, :valor_bem)
  end

end
