class SubscriberList < ApplicationRecord 
  belongs_to :user
  has_many :sublist_subs
  has_many :subscribers, through: :sublist_subs
  has_many :sublist_bulletins
  has_many :bulletins, through: :sublist_bulletins
  validates :list_name, presence: true, length: {minimum: 4, maximum: 100}
  validates :list_type, presence: true, length: {minimum: 4, maximum: 100}
end