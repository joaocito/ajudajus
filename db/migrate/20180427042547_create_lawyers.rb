class CreateLawyers < ActiveRecord::Migration[5.1]
  def change
    create_table :lawyers do |t|
      t.string :nome
      t.string :estado

      t.timestamps
    end
  end
end