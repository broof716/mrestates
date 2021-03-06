class User < ApplicationRecord
  has_many :marketplaces
  has_many :estates
  has_many :comments
  has_many :pays
  has_many :payed_marketplaces, through: :pays, source: :marketplace
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def payed_in?(marketplace)
    return payed_marketplaces.include?(marketplace)
  end
end
