class Squad-Lists
  attr_reader :rank, :name, :score, :margin_of_victory, :squad, :player_count
  @@all = []

  def initialize(:rank, :name, :score, :margin_of_victory, :squad, :player_count)
    @rank = rank
    @name = name
    @score = score
    @margin_of_victory = margin_of_victory
    @squad = squad
    @player_count = player_count
    @@all << self
  end

  def self.all
    @@all
  end
end
