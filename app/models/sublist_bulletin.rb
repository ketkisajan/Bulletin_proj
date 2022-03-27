class SublistBulletin < ApplicationRecord 
  belongs_to :subscriber_list
  belongs_to :bulletin
end