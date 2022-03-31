class Crituser < ApplicationRecord 
  has_many :criteria_bulletins
  has_many :bulletins, through: :criteria_bulletins
end