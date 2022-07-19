
module Flats
  module Helpers extend ActiveSupport::Concern
    def location
      return "#{self.latitude&.round(3)}, #{self.longitude&.round(3)} (#{self.neighborhood&.name})"
    end
  end
end