# Dona Maria

### Traduções

`pt-BR` -> `en`

```yml
models:
  candidato: candidate
  candidatura: candidature
  despesa: expenditure
  doação: donation
  patrimônio: patrimony
  proposta: proposal
  receita: revenue

attributes:
  candidate:
    nome_candidato: name
    descricao_ocupacao: occupation
    descricao_sexo: gender
    numero_titulo_eleitor: voter_registration
  candidatura:
    sequencial_candidato: ?
    ano_eleicao: election_year
    descricao_eleicao: election_description
    sigla_UF: federative_unit_symbol
    descricao_UE: federative_unit_description
    descricao_cargo: job_title
    numero_candidato: candidate_number
    sigla_partido: political_party_symbol
    composicao_legenda: political_caption
    desc_sit_tot_turno: ?
  despesa:
    sequencial_candidato: ?
    nome_fornecedor: seller
    valor_despesa: price
    descricao_despesa: description
  doação:
    #TODO
  patrimônio:
    sequencial_candidato: ?
    detalhe_bem: description
    valor_bem: price
  proposta:
    #TODO
  receita:
    sequencial_candidato: ?
    numero_recibo_eleitoral: receipt_title
    nome_doador: donator
    valor_receita: price
    descricao_da_receita: description

associations:
  candidate:
    user: user
    candidaturas: candidatures
  candidature:
    candidato: candidate
    receitas: revenues
    despesas: expenditures
    patrimonios: patrimonies
  expenditure:
    candidatura: candidature
  donation:
    #TODO
  patrimony:
    candidatura: candidature
  proposal:
    #TODO
  revenue:
    candidatura: candidature
```
