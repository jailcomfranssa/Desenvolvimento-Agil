class EnderecosSerializer < ActiveModel::Serializer
  attributes :id,  :rua, :numero, :complemento, :cidade, :estado, :bairro

  has_many :user

  
end
