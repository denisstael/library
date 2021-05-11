class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false, default: ""
      t.string :author, null: false
      t.string :description
      t.string :publishing_company
      t.string :edition
      t.string :isbn
      t.string :status
      t.integer :pages_number
      t.integer :edition_year
      t.integer :exemplary

      t.timestamps
    end
  end
end
