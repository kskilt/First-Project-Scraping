
# This class handles scraping, and not puts, but it will create other objects
class Scraper
  def self.scrape_index_page(url)
    index_page = Nokogiri::HTML(open(url))
    body = index_page.css("tbody")
    stuff = []
    e = index_page.css("tbody").css("tr").first.css("td").first.css("a").text
    details = index_page.css("tbody").css("tr").each do |card|
      card.css("td").each do |detail|
        stuff << detail.text
      end
        event = stuff[0]
        location = stuff[1]
        date = stuff[4]
        format = stuff[5]
        player_count = stuff[7].strip.to_i
        Tournament.new(event,location,date,format,player_count)
        stuff = []
    end
  end
end
