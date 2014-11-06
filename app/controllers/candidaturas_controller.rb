class CandidaturasController < ApplicationController
  def index
    @candidaturas = Candidatura.page(params[:page]).per(10)
  end

  def new
    @candidatura = Candidatura.new
  end

  def create
    @candidatura = Candidatura.new(candidatura_params)
  end

  def import
    Candidatura.import
    redirect_to candidaturas_path
  end

  private
    def set_candidatura
      @candidatura = Candidatura.find(params[:id])
    end

    def candidatura_params
      params.require(:candidatura).permit(:ano_eleicao, :descricao_eleicao, :sigla_UF, :descricao_UE, :descricao_cargo, :sequencial_candidato, :numero_candidato, :sigla_partido, :composicao_legenda, :desc_sit_tot_turno)
    end

end
