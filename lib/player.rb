# frozen_string_literal: true.

class Player
  attr_reader :rank, :name, :score, :squadlist, :tournament
  @@all = []


  def initialize(rank, name, score, squadlist, tournament)
    @rank = rank
    @name = name
    @score = score
    @tournament = tournament
    @squadlist = squadify(squadlist)
    @@all << self
  end

  def self.all
    @@all
  end

  def squadify(squadlist) #This is a method to clean up raw data
    if squadlist != nil
      squadlist.strip.split("\n").map{|squad| squad.strip}
    end
  end

end
