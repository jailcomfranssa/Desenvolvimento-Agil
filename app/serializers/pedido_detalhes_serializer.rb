class PedidoDetalhesSerializer < ActiveModel::Serializer
  attributes :id, :quantidade
  has_many :pedido
  has_many :produto
end
