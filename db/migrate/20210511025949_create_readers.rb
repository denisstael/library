class CreateReaders < ActiveRecord::Migration[6.0]
  def change
    create_table :readers do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email
      t.date :birth_date

      t.timestamps
    end
  end
end
