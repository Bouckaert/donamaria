shared_context "MCN response bodies" do
  let(:candidates_response_body) do
    [
      {
        id: 2014250000002408, uf: "SP", nomeCargo: "DEPUTADO ESTADUAL",
        nomeParlamentar: "(XUXA) EDMAR GODOY", nomeCompleto: "EDMAR GODOY DE BRITO",
        sequencial: 250000002408, numero: 14610, nomeSitCandidatura: "DEFERIDO",
        siglaPartido: "PTB", nomePartido: "PARTIDO TRABALHISTA BRASILEIRO",
        codLegenda: 250000000051, nomeLegenda: "PARTIDO ISOLADO", 
        composicaoLegenda: "PTB", sexo: "MASCULINO", nomeRaca: "BRANCA",
        nomeOcupacao: "VIGILANTE", nomeEscolaridade: "ENSINO FUNDAMENTAL COMPLETO",
        municipioNascimento: "ARAÇATUBA", estadoNascimento: "SP", totalBens: 0.0,
        totalArrecadado: 0.0, ehParlamentarAtual: false, cargoParlamentarAtual:"",
        codParlamentarAtual: ""
      }
    ].to_json
  end

  let(:patrimonies_response_body) do
    [
      {
        id: 82527,
        codBem: 13,
        tipoBem: "Terreno",
        descricaoBem:
          "LOTE 85 DO CONDOMINIO ALPHAVILLE PORTO ALEGRE NORTE - PORTO ALEGRE - RS",
        valorBem: 337983
      }
    ].to_json
  end

  let(:revenues_response_body) do
    [
      {
        ano: 2014,
        partido: "PT",
        candidatoId: 280000000083,
        cnpj: "02916265000160",
        nomeDoador: "JBS S/A",
        nomeDoadorReceita: "JBS S/A",
        atividadeEconomica: "Frigorífico - abate de bovinos",
        data: 1412121600000,
        valor: 1.0E7,
        tipoReceita: "Recursos de pessoas jurídicas",
        fonteRecurso: "Nao especificado",
        especieRecurso: "Transferência eletrônica",
        descricaoReceita: "#NULO"
      }
    ].to_json
  end

  let(:candidature_result_response_body) do
    {
      candidatoId: 2014280000000083,
      votos: 43267668,
      votosTotais: 104023802,
      percentual: 0.41593998670578003,
      resultado: 2,
    }.to_json
  end
end
