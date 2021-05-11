class Loan < ApplicationRecord

  belongs_to :book
  belongs_to :reader

  validates :loan_date, :devolution_date, presence: true
end
