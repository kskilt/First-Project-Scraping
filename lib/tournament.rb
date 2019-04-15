# frozen_string_literal: true

class Tournament
  attr_reader :event, :player_count, :link

  def initialize(event, player_count, link)
    @event = event
    @player_count = player_count
    @link = link
  end

  def self.tournament_link
    @link
  end

end
