# frozen_string_literal: true.

class Tournament
  attr_reader :event, :location, :date, :format, :player_count, :link, :id
  @@all = []
  @@id = 1

  def initialize(event, location, date, format, player_count, link)
    @event = event
    @location = location
    @date = date
    @format = format
    @player_count = player_count
    @id = @@id
    @link = link
    @@all << self
    @@id += 1
  end

  def self.all
    @@all
  end

  def self.tournament_link
    @link
  end

    def self.find_by_id(id)
    all.find do |tournament|
      tournament.id == id.to_i
    end
  end
end
