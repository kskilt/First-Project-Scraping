
# This class handles scraping, and not puts, but it will create other objects
class Scraper
  # url = "https://listfortress.com/"

  def self.scrape_index_page(url)
    index_page = Nokogiri::HTML(open(url))
    body = index_page.css("tbody")
    # lists = body.css("tr").first
    # nextlevel = lists.css("td").first
    # name = lists.css("td").first.css("a").text
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
        # binding.pry
        # Tournament.new(event,location,date,format,player_count)
        # stuff = []

              Tournament.new(event,location,date,format,player_count)
        stuff = []
    end
    binding.pry
  end
end

# events = []
#     index_page.css("https://listfortess.com/").each do |card|
#       card.css(".tr").each do |event|
#         student_profile_link = "#{event.attr('href')}"
#         student_location = student.css('.student-location').text
#         student_name = student.css('.student-name').text
#         students << {name: student_name, location: student_location, profile_url: student_profile_link}
#       end
#     end
#     students
#   end

