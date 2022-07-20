module Neighborhoods
  module BoundaryValidation extend ActiveSupport::Concern
    def boundary_validation
      return if self.west_boundary.nil? || self.east_boundary.nil? || self.south_boundary.nil? || self.north_boundary.nil?
      
      if self.west_boundary > self.east_boundary || self.west_boundary == self.east_boundary
        errors.add(:west_boundary, "west boundary must be less than east boundary")
      end

      if self.south_boundary > self.north_boundary || self.south_boundary == self.north_boundary
        errors.add(:south_boundary, "south boundary must be less than north boundary")
      end
    end
  end
end