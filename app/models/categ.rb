class Categ < ApplicationRecord
    has_many :produtos
    accepts_nested_attributes_for :produtos
    validates :nome, presence: true 
end
