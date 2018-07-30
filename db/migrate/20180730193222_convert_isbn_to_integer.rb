class ConvertIsbnToInteger < ActiveRecord::Migration[5.2]
  # En vez de change, cambiar a up y Down
  # def change
  # end
  def up
    change_column :books, :isbn, :integer
  end

  def down
    change_column :books, :isbn, :string
  end
end
