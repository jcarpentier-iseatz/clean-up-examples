if ( @activity_availability.destination_location rescue false )
  @analytics.destination = @activity_availability.destination_location.name rescue nil
elsif ( @activity_availability.location rescue false )
  @analytics.destination = @activity_availability.location.name rescue nil
end

# what I think we're trying to do here
location = @activity_availability.try(:destination_location) || @activity_availability.try(:location)
@analytics.destination = location.try(:name)
