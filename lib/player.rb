# frozen_string_literal: true

class Player
  attr_reader :rank, :name, :score, :squadlist, :tournament
  @@all = []

  def initialize(rank, name, score, squadlist, tournament)
    @rank = rank
    @name = name
    @score = score
    @tournament = tournament
    @squadlist = formatting(squadlist)
    @@all << self
  end

  def self.all
    @@all
  end

  def formatting(squadlist)
    squadlist.strip.split("\n").map(&:strip) unless squadlist.nil?
  end
end
