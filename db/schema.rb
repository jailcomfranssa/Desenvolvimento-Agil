# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_16_050226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categs", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "bairro"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "pedido_detalhes", force: :cascade do |t|
    t.float "quantidade"
    t.bigint "pedido_id", null: false
    t.bigint "produto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_pedido_detalhes_on_pedido_id"
    t.index ["produto_id"], name: "index_pedido_detalhes_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "codigo_ean13"
    t.float "peso"
    t.float "comprimento"
    t.float "altura"
    t.string "imagem"
    t.string "descricao"
    t.string "descricao_curta"
    t.float "preco"
    t.string "fabricante"
    t.string "categ"
    t.integer "quant"
    t.bigint "categ_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categ_id"], name: "index_produtos_on_categ_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "is_Admin", default: "0"
    t.string "is_user", default: "1"
    t.date "nascimento"
    t.string "tipo"
    t.string "documento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enderecos", "users"
  add_foreign_key "pedido_detalhes", "pedidos"
  add_foreign_key "pedido_detalhes", "produtos"
  add_foreign_key "pedidos", "users"
  add_foreign_key "produtos", "categs"
end
