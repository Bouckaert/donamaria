class CandidaturesController < ApplicationController
  def index
    @candidatures = Candidature.page(params[:page]).per(10)
    @cnd = Candidature.new.patrimony_by_gender("MASCULINO")
    @cnf = Candidature.new.patrimony_by_gender("FEMININO")
  end

  def new
    @candidature = Candidature.new
  end

  def create
    @candidature = Candidature.new(candidature_params)
  end

  def import
    Candidature.import
    redirect_to candidatures_path
  end

  private
    def set_candidature
      @candidature = Candidature.find(params[:id])
    end

    def candidature_params
      params.require(:candidature).permit(:ano_eleicao, :descricao_eleicao, :sigla_UF, :descricao_UE, :descricao_cargo, :sequencial_candidato, :numero_candidato, :sigla_partido, :composicao_legenda, :desc_sit_tot_turno)
    end

end
