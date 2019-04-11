class PlayerList
  attr_reader :rank, :player_name, :score, :squadlist
  @@all = []


  def initialize(rank, player_name, score, squadlist)
    @rank = rank
    @player_name = player_name
    @score = score
    @squadlist = squadify(squadlist)
    @@all << self
  end

  def self.all
    @@all
  end

  def squadify(squadlist) #This is a method to clean up raw data
    squadlist.strip.split("\n").map{|squad| squad.strip}
  end
  # binding.pry
end
