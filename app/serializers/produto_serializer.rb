class ProdutoSerializer < ActiveModel::Serializer
  attributes :id, :nome, 
  :codigo_ean13,
	:peso,
	:comprimento,
	:altura,
	:imagem,
	:descricao,
	:descricao_curta,
	:preco,
	:fabricante,
	:quant,
	:categ_id

  has_many :categ
  
end
