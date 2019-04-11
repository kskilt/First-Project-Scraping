class Tournament
  attr_reader :event, :location, :date, :format, :player_count
  @@all = []

  def initialize(event,location,date,format,player_count)
    @event = event
    @location = location
    @date = date
    @format = format
    @player_count = player_count
    @@all << self
  end

  def self.all
    @@all
  end
end
