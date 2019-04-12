# frozen_string_literal: true.

class Player
  attr_reader :rank, :name, :score, :squadlist
  @@all = []


  def initialize(rank, name, score, squadlist)
    @rank = rank
    @name = name
    @score = score
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

  # binding.pry
end
