class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :year
      t.boolean :available
      t.string :section
      t.integer :shelf
      t.integer :order

      t.timestamps
    end
  end
end
