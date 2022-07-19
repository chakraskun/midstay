module Flats
  module AssignNeighborhood extend ActiveSupport::Concern
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
        end
      end
    end
  end
end