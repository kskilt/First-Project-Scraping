
# This class handles scraping, and not puts, but it will create other objects
class Scraper
  def self.tournament_scraper(url)
    index_page = Nokogiri::HTML(open(url))
    event_details = []
    link = index_page.css("tbody").css("tr").first.css("td").first.css("a").first["href"]
    details = index_page.css("tbody").css("tr").each do |tournaments|
      tournaments.css("td").each do |detail|
        event_details << detail.text
      end
        Tournament.new(event_details[0],event_details[1],event_details[4],event_details[5],event_details[7].strip.to_i, link)
        event_details = []
    end
  end

    def self.player_list_scraper(url)
    details = []
    Nokogiri::HTML(open(url)).css("table").css("tr").each do |players|
      players.css("td").each do |squadlist|
        details << squadlist.text
      end
      if details[0] != nil #the header was being turned into a class with nil values, this checks value of playing ranking which filters out header and duplicates events with no value
        PlayerList.new(details[0], details[2], details[3], details[6])
        details = []
      else details =[] #this resets the array to accept the next tournament
      end
    end

  end
end
