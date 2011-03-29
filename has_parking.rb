def has_parking?
  self.activities.each do |activity|
    return true if activity.parent_category_code == InPathConstants::ACTIVITY_CATEGORY_CODE__PARKING
  end
  return false
end

def has_parking?
  self.activities.any? { |a| a.parent_category_code == InPathConstants::ACTIVITY_CATEGORY_CODE__PARKING }
end
