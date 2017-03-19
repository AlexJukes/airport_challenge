require './docs/plane.rb'

class Airport
  WEATHER = [:stormy, :clear, :clear, :clear]
  def initialize(name="airport", skies = WEATHER.sample)
    @name = name
    @hangar = []
    @capacity
    @weather = skies
  end

  attr_reader :hangar, :weather

  def land(plane)
    raise 'Plane has already landed' unless plane.airborne
    return 'Plane cannot land in stormy conditions' if (weather == :stormy)
    plane.ground
    hangar << plane
  end

  def take_off(plane)
    return 'Plane cannot take off in stormy conditions' if (weather == :stormy)
    hangar.each {|docked_plane| return (hangar.slice!(hangar.index(plane))).fly if docked_plane == plane && !plane.airborne }
    raise 'Plane not in hangar'
  end

  def check_weather
    update_weather
  end

  attr_reader :hangar, :weather

  private

  def update_weather
    @weather = WEATHER.sample
  end

  def include?(plane)
    hangar.include?(plane)
  end
end
