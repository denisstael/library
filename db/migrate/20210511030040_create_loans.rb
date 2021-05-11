class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.date :loan_date, null: false
      t.date :devolution_date, null: false
      t.date :discharge_date
      t.string :status

      t.timestamps
    end
  end
end
