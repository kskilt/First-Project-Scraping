# frozen_string_literal: true.

# Handles talking to user, with puts and gets. Does not scrape.
class CLI
  attr_accessor :input, :tournament
  def call
    greeting
    menu
  end

  def greeting
    puts "Welcome to X-Wing Tournament Results!".colorize(:red)
  end

  def menu
    puts "Here are the latest X-Wing tournaments around the world:".colorize(:red)
    list
    puts "Please enter a tournment number to see the players in that specific tournament.".colorize(:red)
    input = gets.strip.downcase
    @tournament = tournament_by_id(input)
    @tournament

    display_players

  end

  def list
    Scraper.tournament_scraper("https://listfortress.com/")
    Tournament.all.each do |tourny|
      puts "#{tourny.id}: #{tourny.event} with #{tourny.player_count} players".colorize(:light_blue)
      puts "---------------------".colorize(:blue)
    end
  end

  def validate_tournament(input)
    if input.is_a Integer
      @tournament = tournament_by_id(input)
      @tournament
    elsif input == "exit"
      goodbye
    else
      puts "That was not a validate option. Please type the corresponding number with the tournament you would like to see"
      list
    end
  end
  def tournament_by_id(input)
    Tournament.find_by_id(input)
  end

  def display_players
    Scraper.player_scraper(tournament)
    Player.all.each do |player| #Tournament.players.each
      puts "#{player.name} placed #{player.rank} with a score of #{player.score} running this squad:".colorize(:green)
      player.squadlist.each { |pilot|
        if player.squadlist !=nil
        puts "#{pilot}".colorize(:light_blue)
        puts "---------------------".colorize(:blue)
        else puts "<This infomation is not available>".colorize(:light_blue)
             puts"---------------------".colorize(:blue)
        end}
    end
  end

  def goodbye
    "Thank you for visiting. Goodbye!"
  end
# should make recursive so directs user back to the main menu or to exit

end

      # Scraper.tournament_scraper("https://listfortress.com/")
    # What do you select
    # take user input, and use it to "find" the right instance of tournament
    # pass that to the method below
    # Scraper.player_scraper(Tournament.all.first)

