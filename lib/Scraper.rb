class Scraper
  url = "https://listfortress.com/"

  def self.scrape_index_page(url)
    index_page = Nokogiri::HTML(open(url))
    body = index_page.css("tbody")
    lists = body.css("tr").first
    nextlevel = lists.css("td").first
    name = lists.css("td").first.css("a").text
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

