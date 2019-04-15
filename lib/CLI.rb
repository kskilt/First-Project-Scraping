# frozen_string_literal: true

class CLI
  attr_accessor :input, :tournament

  def call
    @tournaments = Scraper.tournament_scraper("https://listfortress.com/")
    greeting
    catch(:goodbye) do
      menu
    end
    exit
  end

  def greeting
    puts "Welcome to X-Wing Tournament Results!".colorize(:red)
  end

  def menu
    puts "Here are the latest X-Wing tournaments around the world:".colorize(:red)
    list
    puts "Please enter a tournment number to see a specific tournament (1-25).".colorize(:red)
    puts " You may also type 'goodbye' to exit the session".colorize(:red)
    input = gets.strip.downcase
    if input == "goodbye"
      goodbye
    else
      input = input.to_i
    end
    navigate_tournament(input)
  end

  def list
    @tournaments.each_with_index do |tourny, index|
      id = index + 1
      puts "#{id}: #{tourny.event} with #{tourny.player_count} players".colorize(:light_blue)
      puts "---------------------".colorize(:blue)
    end
  end

  def navigate_tournament(input)
    if input >= 1 && input <= 25
      @tournament = tournament_by_id(input)
      tournament
      display_players
    else
      invalid
    end
  end

  def tournament_by_id(id)
    @tournaments[id - 1]
  end

  def display_players
    tournament.players.each do |player|
      next if player.nil?

      puts "#{player.name} placed #{player.rank} with a score of #{player.score}".colorize(:green)
      puts "running this squad:".colorize(:green)
      player.squadlist.each do |pilot|
        puts pilot.to_s.colorize(:light_blue)
        puts "---------------------".colorize(:blue)
      end
    end
    command_prompt
  end

  def command_prompt
    puts "Enter 'return' to return to the menu or 'goodbye' to exit the session.".colorize(:red)
    user_command
  end

  def user_command
    command = gets.strip.downcase
    case command
    when "return"
      return_to_menu
    when "goodbye"
      goodbye
    else
      invalid
    end
  end

  def return_to_menu
    menu
  end

  def invalid
    puts "Please enter a valid command.".colorize(:red)
    menu
  end

  def goodbye
    puts "Thank you for visiting. Goodbye!".colorize(:red)
    throw :goodbye
  end
end
