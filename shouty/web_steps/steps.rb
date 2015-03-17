require 'shouty'

module ShoutyDomain
  def the_network
    @the_network ||= Network.new
  end
end
World(ShoutyDomain)

Before do
  @locations = {}
  @people = {}
end

Given(/^the following geolocations:$/) do |location_data|
  location_data.hashes.each do |location|
    place = location["Place"]
    lat = location["Latitude"]
    long = location["Longitude"]
    @locations[place] = Location.new(Float(lat), Float(long))
  end
end

Given(/^(\w+) is at "(.*?)"$/) do |name, place|
  location = @locations[place]
  path = "/locate?name=#{name}&lat=#{location.latitude}&long=#{location.longitude}"
  visit path
end
