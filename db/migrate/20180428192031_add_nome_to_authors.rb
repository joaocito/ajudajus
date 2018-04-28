class AddNomeToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :nome, :string
    add_column :authors, :estado, :string
  end
end
