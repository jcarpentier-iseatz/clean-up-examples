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
  
