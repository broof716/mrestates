class Pay < ApplicationRecord
  belongs_to :marketplace
  belongs_to :user
end
