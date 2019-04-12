# frozen_string_literal: true.

# This class handles scraping, and not puts, but it will create other objects
class Scraper
  def self.tournament_scraper(url)
    index_page = Nokogiri::HTML(open(url))
    link = "https://listfortress.com"+index_page.css("tbody").css("tr").first.css("td").first.css("a").first["href"]
    details = index_page.css("tbody").css("tr").each do |tournaments|
      event_details = []
      tournaments.css("td").each do |detail|
        event_details << detail.text
      end
      Tournament.new(
        event_details[0],
        event_details[1],
        event_details[4],
        event_details[5],
        event_details[7].strip.to_i,
        link
      )
    end
  end

  def self.player_scraper(tournament)
    Nokogiri::HTML(open(tournament)).css("table").css("tr").each do |players|
      details = []
      players.css("td").each do |squadlist|
      details << squadlist.text
      end
      if !details[0].nil? # The header was being turned into a class with nil values, this checks value of playing ranking which filters out header and duplicates events with no value
        Player.new(details[0], #rank
          details[2], #name
          details[3], #score
          details[6] #squadlist
        )
      end
    end
  end
end
