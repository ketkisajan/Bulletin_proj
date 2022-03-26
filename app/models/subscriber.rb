class Subscriber < ApplicationRecord 

  has_many :sublist_subs
  has_many :subscriber_lists, through: :sublist_subs
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                        uniqueness: {case_sensitive: false},
                        length: { maximum: 105 },
                        format: {with: VALID_EMAIL_REGEX}
                        
end