class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :estado

      t.timestamps
    end
  end
end
