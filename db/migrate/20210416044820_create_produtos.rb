class CreateProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :codigo_ean13
      t.float :peso
      t.float :comprimento
      t.float :altura
      t.string :imagem
      t.string :descricao
      t.string :descricao_curta
      t.float :preco
      t.string :fabricante
      t.string :categ
      t.integer :quant
      t.references :categ, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
