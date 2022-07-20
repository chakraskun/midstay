require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  it "is valid with valid attributes" do
    expect(
      Neighborhood.new(
        name: 'test',
        north_boundary: -0.6061452e1,
        south_boundary: -0.6379064e1,
        east_boundary: 0.106982148e3,
        west_boundary: 0.10668041e3,
      )
    ).to be_valid
  end

  it "is not valid without name" do
    expect(
      Neighborhood.new(
        name: nil,
        north_boundary: -0.6061452e1,
        south_boundary: -0.6379064e1,
        east_boundary: 0.106982148e3,
        west_boundary: 0.10668041e3,
      )
    ).to_not be_valid
  end

  it "is not valid without boundary" do
    expect(
      Neighborhood.new(
        name: 'test',
        south_boundary: -0.6379064e1,
        west_boundary: 0.10668041e3,
      )
    ).to_not be_valid
  end

  it "is not valid with invalid boundary" do
    expect(
      Neighborhood.new(
        name: 'test',
        north_boundary: -0.6061452e1,
        south_boundary: -0.6379064e1,
        east_boundary: 0.106982148e3,
        west_boundary: 0.106982148e3,
      )
    ).to_not be_valid
  end
end
