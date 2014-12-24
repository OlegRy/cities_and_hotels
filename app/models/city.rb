class City < ActiveRecord::Base

  has_many :hotels
  validates :name, uniqueness: true, presence: true

end
