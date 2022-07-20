require 'rails_helper'

RSpec.describe Flat, type: :model do
  neighborhood_id = Neighborhood.find_by(name: 'Jakarta').id
  it "is valid with valid attributes" do
    expect(
      Flat.new(
        name: 'testing12345',
        neighborhood_id: neighborhood_id,
        longitude: 0.106815504e3,
        latitude: -0.6301842e1
      )
    ).to be_valid
  end

  it "is not valid without a name" do
    expect(
      Flat.new(
        name: nil,
        neighborhood_id: neighborhood_id,
        longitude: 0.106815504e3,
        latitude: -0.6301842e1
      )
    ).to_not be_valid
  end

  it "is not valid if longitude out of bounds" do
    expect(
      Flat.new(
        name: 'testing12345',
        neighborhood_id: neighborhood_id,
        longitude: 270,
        latitude: -0.6301842e1
      )
    ).to_not be_valid
  end

  it "is not valid if latitude out of bounds" do
    expect(
      Flat.new(
        name: 'testing12345',
        neighborhood_id: neighborhood_id,
        longitude: 0.106815504e3,
        latitude: 180
      )
    ).to_not be_valid
  end

  
end
