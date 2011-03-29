def best_guess_location_name
  if self.location && self.location.name
    return self.location.name
  else
    if !self.hotels.empty?
      self.hotels.each do |hotel|
        if (hotel.location)
          return hotel.location.split(',')[0];
        end
      end  
    end     
  end
  return '';
end

def best_guess_location_name
  if self.location.try(:name)
    self.location.name
  elsif self.hotels.present?
    location = hotels.find(&:location)
    location.split(',').first if location
  end
end

