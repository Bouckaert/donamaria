# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141106132637) do

  create_table "candidaturas", force: true do |t|
    t.string   "sequencial_candidato"
    t.integer  "ano_eleicao"
    t.string   "descricao_eleicao"
    t.string   "sigla_UF"
    t.string   "descricao_UE"
    t.string   "descricao_cargo"
    t.string   "numero_candidato"
    t.string   "sigla_partido"
    t.string   "composicao_legenda"
    t.string   "desc_sit_tot_turno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "despesas", force: true do |t|
    t.string   "sequencial_candidato"
    t.string   "nome_fornecedor"
    t.decimal  "valor_despesa",        precision: 10, scale: 2
    t.string   "descricao_despesa"
    t.integer  "candidatura_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receita", force: true do |t|
    t.string   "sequencial_candidato"
    t.string   "numero_recibo_eleitoral"
    t.string   "nome_doador"
    t.decimal  "valor_receita",           precision: 10, scale: 2
    t.string   "descricao_da_receita"
    t.integer  "candidatura_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
