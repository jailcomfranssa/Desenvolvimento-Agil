class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :is_Admin, :default =>'0'
      t.string :is_user,:default => '1'
      t.date :nascimento
      t.string :tipo
      t.string :documento

      t.timestamps
    end
  end
end
