# frozen_string_literal: true.

# This class handles scraping, and not puts, but it will create other objects
class Scraper
  LINK = "https://listfortress.com"
  def self.tournament_scraper(url)
    index_page = Nokogiri::HTML(open(url))
    details = index_page.css("tbody").css("tr").each do |tournament|
      link = LINK + tournament.css("a").first["href"]
      event_detail = tournament.css("td").map { |detail| detail.text}
      Tournament.new(
        event_detail[0], # event
        event_detail[7].strip.to_i, # player_count
        link)
    end
  end

  def self.player_scraper(tournament)
    player_scraper = Nokogiri::HTML(open(tournament.link)).css("table").css("tr")
    player_scraper.each do |player|
          detail = player.css("td").map do |squadlist|
            squadlist.text
          end
          unless detail[0].nil?
            unless detail[3].include?("Edit")
              Player.new(detail[0], # rank
                        detail[2], # name
                        detail[3], # score
                        detail[6], # squadlist
                        tournament)
            end
          end
    end
  end
end
