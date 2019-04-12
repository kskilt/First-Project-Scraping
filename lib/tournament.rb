# frozen_string_literal: true.

class Tournament
  attr_reader :event, :location, :date, :format, :player_count, :tournament_link, :id
  @@all = []
  @@id = 1

  def initialize(event, location, date, format, player_count, link)
    @event = event
    @location = location
    @date = date
    @format = format
    @player_count = player_count
    @tournament_link = second_layer_url(link)
    @id = @@id
    @@all << self
    @@id += 1
  end

  def second_layer_url(link)
    "https://listfortress.com/#{link}"
  end

  def self.all
    @@all
  end

  def self.tournament_link
    @tournament_link
  end
end
