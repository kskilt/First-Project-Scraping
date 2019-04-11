# Handles talking to user, with puts and gets. Does not scrape.
class CLI
  attr_accessor :input
  def call
    puts "Welcome to Xwing Tournament Results!"
    puts "Would you like to see the most recent tournaments?"
  end

end
