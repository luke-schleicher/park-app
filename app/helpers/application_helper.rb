module ApplicationHelper

  def display_map(park)
    "https://www.google.com/maps/embed/v1/place?key=#{ENV['MAPS_API_KEY']}&q=<%= park.street_address %>, Chicago, IL" 
  end
end
