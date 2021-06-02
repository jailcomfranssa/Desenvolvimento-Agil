class CreatePedidoDetalhes < ActiveRecord::Migration[6.1]
  def change
    create_table :pedido_detalhes do |t|
      t.float :quantidade
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
