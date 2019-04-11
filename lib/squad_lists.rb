class SquadList
  attr_reader :rank, :player_name, :score, :squadlist
  @@all = []


  def initialize(rank, player_name, score, squadlist)
    @rank = rank
    @player_name = player_name
    @score = score
    @squadlist = squadlist
    @@all << self
  end

  def self.all
    @@all
  end
end
