class CandidatosController < ApplicationController
  def index
    @candidatos = Candidato.page(params[:page]).per(10)

    if params[:search].present?
      @candidatos = Candidato.with_nome(params[:search]).page(params[:page]).per(10)
    end
    if params[:gender].present?
      @candidatos= Candidato.with_sexo(params[:gender]).page(params[:page]).per(10)
    end

  end

  def import
    Candidato.import
    redirect_to candidatos_path
  end

    def candidato_params
      params.require(:candidato).permit(:nome_candidato, :descricao_ocupacao, :descricao_sexo, :numero_titulo_eleitor)
    end
end
