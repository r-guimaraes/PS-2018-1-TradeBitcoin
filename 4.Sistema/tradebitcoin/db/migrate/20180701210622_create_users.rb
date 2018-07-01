class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :rg
      t.integer :cpf

      t.timestamps null: false
    end
    add_index :users, :rg, unique: true
    add_index :users, :cpf, unique: true
  end
end
