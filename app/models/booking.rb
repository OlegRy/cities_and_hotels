class Booking < ActiveRecord::Base
  #validates :user_name, presence: true
  belongs_to :room
end
