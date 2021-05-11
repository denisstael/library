class AddReferencesToLoans < ActiveRecord::Migration[6.0]
  def change
    add_reference :loans, :book, foreign_key: true
    add_reference :loans, :reader, foreign_key: true
  end
end
