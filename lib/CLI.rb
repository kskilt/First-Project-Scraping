# frozen_string_literal: true

class CLI
  attr_accessor :input, :tournament

  def call
    Scraper.tournament_scraper("https://listfortress.com/")
    greeting
    menu
  end

  def greeting
    puts "Welcome to X-Wing Tournament Results!".colorize(:red)
  end

  def menu
    puts "Here are the latest X-Wing tournaments around the world:".colorize(:red)
    list
    puts "Please enter a tournment number to see a specific tournament.".colorize(:red)
    puts " You may also type 'goodbye' to exit the session".colorize(:red)
    input = gets.strip.downcase.to_i
    navigate_tournament(input)
  end

  def list
    Tournament.all.each_with_index do |tourny, index|
      id = index + 1
      puts "#{id}: #{tourny.event} with #{tourny.player_count} players".colorize(:light_blue)
      puts "---------------------".colorize(:blue)
    end
  end

  def navigate_tournament(input)
    if input == "goodbye"
      goodbye
    else
      @tournament = tournament_by_id(input)
      tournament
      display_players
    end
  end

  def tournament_by_id(input)
    Tournament.find_by_id(input)
  end

  def display_players
    Scraper.player_scraper(tournament)
    Player.all.each do |player|
      next if player.nil?

      puts "#{player.name} placed #{player.rank} with a score of #{player.score}".colorize(:green)
      puts "running this squad:".colorize(:green)
      player.squadlist.each do |pilot|
        puts pilot.to_s.colorize(:light_blue)
        puts "---------------------".colorize(:blue)
      end
    end
    goodbye
  end

  def goodbye
    puts "Thank you for visiting. Goodbye!".colorize(:red)
  end
end
