class CreateSuits < ActiveRecord::Migration[5.1]
  def change
    create_table :suits do |t|
      t.string :descricao
      t.references :client, foreign_key: true
      t.references :lawyer, foreign_key: true

      t.timestamps
    end
  end
end
