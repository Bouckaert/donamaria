class CandidatosController < ApplicationController
  def index
    @candidatos = Candidato.page(params[:page]).per(10)
#    @patrimonio_masculino= Candidatura.new.patrimonio_por_genero("MASCULINO")
#    @patrimonio_feminino= Candidatura.new.patrimonio_por_genero("FEMININO")
#    @receita_masculino= Candidatura.new.receita_por_genero("MASCULINO")
#    @receita_feminino= Candidatura.new.receita_por_genero("FEMININO")
#    @despesa_masculino= Candidatura.new.despesa_por_genero("MASCULINO")
#    @despesa_feminino= Candidatura.new.despesa_por_genero("FEMININO")

    if params[:search].present?
      @candidatos = Candidato.with_nome(params[:search]).page(params[:page]).per(10)
    end
    if params[:gender].present?
      @candidatos= Candidato.with_sexo(params[:gender]).page(params[:page]).per(10)
    end

  end

  def show
    @candidato = Candidato.find(params[:id])
  end

  def import
    Candidato.import
    redirect_to candidatos_path
  end

    def candidato_params
      params.require(:candidato).permit(:nome_candidato, :descricao_ocupacao, :descricao_sexo, :numero_titulo_eleitor)
    end
end
