class Comment < ApplicationRecord
  belongs_to :user


  validates :message, presence: true
  validates :rating, presence: true
end
