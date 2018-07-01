class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :senha
      t.boolean :verificado
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
