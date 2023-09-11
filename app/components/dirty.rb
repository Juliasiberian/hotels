require "faraday"

class Dirty
  def initialize(city)
    @city = city.downcase
  end
  
  def call 
    response = Faraday.get(link)
    doc = Nokogiri::HTML(response.body)
    doc.search(".aqi-value__value").text
  end  

  def link
    case @city
    when "murmansk"
      "https://www.iqair.com/ru/russia/#{@city}"
    when "krasnoyarsk"
      "https://www.iqair.com/ru/russia/krasnoyarsk-krai/#{@city}"
    when "budapest"
      "https://www.iqair.com/ru/hungary/central-hungary/#{@city}"
    else 
      "https://www.iqair.com/ru/russia/#{@city}"
    end
  end
end
