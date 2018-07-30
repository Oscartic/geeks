class AddIndexOnBooksIsbnYearSection < ActiveRecord::Migration[5.2]
  def change
    add_index :books, :isbn
    add_index :books, [:year, :section]
  end
end
