# frozen_string_literal: true.

# Handles talking to user, with puts and gets. Does not scrape.
class CLI
  attr_accessor :input
  def call
    puts "Welcome to Xwing Tournament Results!"
    puts "Here are the tournaments"

    list

    # Scraper.tournament_scraper("https://listfortress.com/")
    # What do you select
    # take user input, and use it to "find" the right instance of tournament
    # pass that to the method below
    # Scraper.player_scraper(Tournament.all.first)
  end

  def list
    Scraper.tournament_scraper("https://listfortress.com/")
    Tournament.all.each do |tournament|
      puts "#{tournament.id}: #{tournament.event}".colorize(:light_blue)
      puts "---------------------".colorize(:blue)
    end
  end


end
