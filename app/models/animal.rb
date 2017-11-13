
class Animal < ActiveRecord::Base
  validates :species, :presence => true
  has_many :sightings
  mount_uploader :image, ImageUploader
end
