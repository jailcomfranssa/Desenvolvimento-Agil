class Pedido < ApplicationRecord
  belongs_to :user
  has_many :pedido_detalhes, dependent: :delete_all 
  accepts_nested_attributes_for :pedido_detalhes
end
