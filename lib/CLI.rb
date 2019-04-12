# frozen_string_literal: true.

# Handles talking to user, with puts and gets. Does not scrape.
class CLI
  attr_accessor :input, :tournament
  def call
    puts "Welcome to X-Wing Tournament Results!".colorize(:red)
    puts "Here are the latest X-Wing tournaments around the world:".colorize(:red)

    list

     puts "Please enter a tournment number to see the players in that specific tournament.".colorize(:red)
    input = gets.strip.downcase
    @tournament = tournament_by_id(input)
    @tournament

    Scraper.player_scraper(tournament.link)
    display_player

  end

  def list
    Scraper.tournament_scraper("https://listfortress.com/")
    Tournament.all.each do |tourny|
      puts "#{tourny.id}: #{tourny.event}".colorize(:light_blue)
      puts "---------------------".colorize(:blue)
    end
  end

  def tournament_by_id(input)
    Tournament.find_by_id(input)
  end

  def display_player
    Scraper.player_scraper(tournament.link)
    Player.all.each do |players|
      puts "#{players.name} placed #{players.rank} with a score of #{players.score} running this squad:".colorize(:green)
        players.squadlist.each do |pilot|
        puts "#{pilot}".colorize(:light_blue)
        puts "---------------------".colorize(:blue)
      end
    end
  end
# should make recursive so directs user back to the main menu or to exit




end


    # if input == 'filter'
    #   filtered_list(filter)
    # elsif input.is_a? Integer
    #   selected_tournament
    # end


      # def filtered_list(filter)
  #   Scraper.tournament_scraper("https://listfortress.com/")
  #   Tournament.all.each do |tournament|
  #       if tournament.filter == filter
  #         puts "#{tournament.id}: #{tournament.event}".colorize(:light_blue)
  #         puts "---------------------".colorize(:blue)
  #       end
  #   end
  # end

      # Scraper.tournament_scraper("https://listfortress.com/")
    # What do you select
    # take user input, and use it to "find" the right instance of tournament
    # pass that to the method below
    # Scraper.player_scraper(Tournament.all.first)

        # puts "Please enter a tournment number to see the players in that tournament, or type 'filter' to refine the list by date, number of players, or format".colorize(:red)
