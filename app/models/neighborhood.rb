class Neighborhood < ApplicationRecord
  include Neighborhoods::BoundaryValidation

  validates :name, presence: true
  validates :west_boundary, presence: true
  validates :east_boundary, presence: true
  validates :south_boundary, presence: true
  validates :north_boundary, presence: true
  validate :boundary_validation, on: :create
  
  has_many :flats
end
