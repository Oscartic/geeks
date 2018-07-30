class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :company, foreign_key: true
      t.string :name, null: false, uniqueness: true
      t.integer :age
    end
  end
end
