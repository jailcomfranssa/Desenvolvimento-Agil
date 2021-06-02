class User < ApplicationRecord

    validates_presence_of :name, :email, :password_digest
    validates  :email, uniqueness: true
    has_secure_password
    has_many :endereco, dependent: :delete_all 
    has_many :pedidos
    accepts_nested_attributes_for :pedidos
    accepts_nested_attributes_for :endereco
end
