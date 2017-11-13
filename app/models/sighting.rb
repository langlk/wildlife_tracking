class Sighting < ActiveRecord::Base
  validates :animal, :location, :region, :presence => true
  belongs_to :animal
  belongs_to :region
end
