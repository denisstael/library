class Book < ApplicationRecord
  has_many :loans

  validates :name, :author, presence: true

  def can_delete?
    loans.count.zero?
  end
end
