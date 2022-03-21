class SubscriberList < ApplicationRecord 
  validates :list_name, presence: true, length: {minimum: 4, maximum: 100}
  validates :list_type, presence: true, length: {minimum: 4, maximum: 100}
end