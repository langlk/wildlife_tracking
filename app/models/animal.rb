class Animal < ActiveRecord::Base
  validates :species, :presence => true
  has_many :sightings
end
