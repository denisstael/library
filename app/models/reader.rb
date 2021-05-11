class Reader < ApplicationRecord
  
  has_many :loans

  validates :name, :email, :phone, :birth_date, presence: true
end
