class Sighting < ActiveRecord::Base
  validates :animal, :location, :region, :presence => true
  belongs_to :animal
  belongs_to :region

  def self.report(start_date, end_date)
    return Sighting.where("date_sighted >= ? AND date_sighted < ?", start_date, end_date)
  end
end
