class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.boolean :active
      t.float :saldo
      t.timestamp :data_encerramento
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
