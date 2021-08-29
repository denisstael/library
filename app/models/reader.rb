class Reader < ApplicationRecord
  has_many :loans

  validates :name, :email, :phone, :birth_date, presence: true

  def can_delete?
    loans.count.zero?
  end
end
