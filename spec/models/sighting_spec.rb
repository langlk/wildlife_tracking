require "rails_helper"

describe Sighting do
  it { should validate_presence_of :animal }
  it { should validate_presence_of :location }
  it { should belong_to :animal }
  it { should belong_to :region }
  it { should validate_presence_of :region }
end
