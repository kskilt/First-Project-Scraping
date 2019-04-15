# frozen_string_literal: true

class Tournament
  attr_reader :event, :player_count, :link
  @@all = []

  def initialize(event, player_count, link)
    @event = event
    @player_count = player_count
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tournament_link
    @link
  end

  def self.find_by_id(id)
    all[id-1]
  end
end
