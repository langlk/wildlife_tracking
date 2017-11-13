class Sighting < ActiveRecord::Base
  validates :animal, :location, :presence => true
  belongs_to :animal
end
