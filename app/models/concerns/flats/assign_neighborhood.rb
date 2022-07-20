module Flats
  module AssignNeighborhood extend ActiveSupport::Concern
    included do
      before_validation :assign_neighborhood, on: [ :create ]
    end

    def assign_neighborhood
      neighborhoods = Neighborhood.all
      neighborhoods.each do |neighborhood|
        if self.longitude.between?(
          neighborhood.west_boundary,
          neighborhood.east_boundary
        ) && self.latitude.between?(
          neighborhood.south_boundary,
          neighborhood.north_boundary
        )
          self.neighborhood_id = neighborhood.id
          break
        else
          errors.add(:neighborhood, "must be within a neighborhood, current available neighborhood #{Neighborhood.all.map(&:name).join(', ')}")
        end
      end
    end
  end
end