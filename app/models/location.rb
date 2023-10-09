class Location < ApplicationRecord
  validates :category, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true

  belongs_to :user

end
