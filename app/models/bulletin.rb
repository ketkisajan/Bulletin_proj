class Bulletin < ApplicationRecord 
  belongs_to :user
  has_many :sublist_bulletins
  has_many :subscriber_lists, through: :sublist_bulletins
  has_many :criteria_bulletins
  has_many :critusers, through: :criteria_bulletins
  validates :subject, presence: true, length: {minimum: 4, maximum: 100}
  validates :body, presence: true, length: {minimum: 4, maximum: 400}
  validates :subscriber_lists, presence: true
  # validates :critusers, presence: true
end