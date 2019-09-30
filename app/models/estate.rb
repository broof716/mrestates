class Estate < ApplicationRecord
  belongs_to :user

  validates :address, :description, presence: true
  validates :name, length: { minimum: 3}
end
