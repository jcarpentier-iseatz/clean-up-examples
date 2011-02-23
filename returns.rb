# http://tomafro.net/2009/08/the-cost-of-explicit-returns-in-ruby

def is_cc_info_required
  return true if @hotel_rooms.size > 0
  @cars.each do |car|
    return true if car.is_guarantee_required.to_b
  end
  return false;
end

def cc_info_required?
  @hotel_rooms.any? || @cars.any? { |car| car.is_guarantee_required.to_b }
end

# maybe related: if this is true, it's true?
def to_b
  ['1', 'TRUE', 'Y', 'YES'].include?(self.upcase) ? true : false
end




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




def has_parking?
  self.activities.each do |activity|
    return true if activity.parent_category_code == InPathConstants::ACTIVITY_CATEGORY_CODE__PARKING
  end
  return false
end

def has_parking?
  self.activities.any? { |a| a.parent_category_code == InPathConstants::ACTIVITY_CATEGORY_CODE__PARKING }
end
  
