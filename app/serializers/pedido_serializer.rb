class PedidoSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :user
  
end
