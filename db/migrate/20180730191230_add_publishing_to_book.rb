class AddPublishingToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :editorial, :string
    add_column :books, :isbn, :string
  end
end
