module Flats
  module CoordinatesValidation extend ActiveSupport::Concern
    def longitude_validation
      if self.longitude.nil?
        errors.add(:longitude, "can't be blank")
      elsif !self.longitude.between?(-180, 180)
        errors.add(:longitude, "must be between -180 and 180")
      end
    end

    def latitude_validation
      if self.latitude.nil?
        errors.add(:latitude, "can't be blank")
      elsif !self.latitude.between?(-90, 90)
        errors.add(:latitude, "must be between -90 and 90")
      end
    end
  end
end