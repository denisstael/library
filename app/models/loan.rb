class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :reader

  validates :loan_date, :devolution_date, presence: true
  validate :valid_dates

  private

  def valid_dates
    errors.add(:base, 'Data de devolução deve ser maior que a data do empréstimo.') if devolution_date < loan_date
  end
end
