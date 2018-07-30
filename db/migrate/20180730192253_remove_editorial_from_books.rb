class RemoveEditorialFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :editorial, :string
  end
end
