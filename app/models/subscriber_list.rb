class SubscriberList < ApplicationRecord 
  belongs_to :user
  has_many :sublist_subs
  has_many :subscribers, through: :sublist_subs
  validates :list_name, presence: true, length: {minimum: 4, maximum: 100}
  validates :list_type, presence: true, length: {minimum: 4, maximum: 100}
end