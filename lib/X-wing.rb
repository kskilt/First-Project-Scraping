class X-wing
  attr_reader :date, :event, :player_count, :format, :location
  @@all = []

  def initialize(:date, :event, :player_count, :format, :location)
    @date = date
    @event = event
    @player_count = player_count
    @format = format
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end
end
