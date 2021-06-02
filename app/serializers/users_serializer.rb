class UsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password,:is_Admin, :is_user, :nascimento, :tipo, :documento
end
