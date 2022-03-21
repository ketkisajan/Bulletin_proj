class Bulletin < ApplicationRecord 
  validates :subject, presence: true, length: {minimum: 4, maximum: 100}
  validates :body, presence: true, length: {minimum: 6, maximum: 400}
end