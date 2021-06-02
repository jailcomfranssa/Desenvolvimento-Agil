class CreateCategs < ActiveRecord::Migration[6.1]
  def change
    create_table :categs do |t|
      t.string :nome

      t.timestamps
    end
  end
end
