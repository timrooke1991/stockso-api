require 'open-uri'
require 'nokogiri'
require 'mechanize'

mechanize = Mechanize.new

last_page = 210;
current_page = 1;
url = "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=1"

until current_page > last_page
  ### Need to create a new variable with the county names
  page = mechanize.get("http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=#{current_page}")


  rows = page.css('table tr td:first-child')
  puts rows
  # while index < rows_total do
  #   country = page.css('table tr')[index]
  #
  #   if country.css('td').length === 2
  #     name = country.css('td a')[0].text
  #
  #     if name === ''
  #       name = country.css('td').text
  #       if name === ''
  #         countries << name
  #       else
  #         countries << 'not found'
  #       end
  #     else
  #       countries << name
  #     end
  #
  #     required_languages.each do |c|
  #       translations = country.css('td')[1].to_s
  #       arr = translations.split('),').select {|e| e.include? c }
  #       value = c.downcase
  #       begin
  #         if !arr.empty?
  #           translated_name = arr.to_s.scan(/<([A-z0-9]*)\b[^>]*>(.*?)<\/\1>/)[-1][-1]
  #           store_languages[value.to_sym] << translated_name
  #         else
  #           store_languages[value.to_sym] << 'not found'
  #         end
  #       rescue
  #         store_languages[value.to_sym] << 'not found'
  #       end
  #     end
  #   end
  #
  # end
  current_page += 1
end

puts "Creating .csv file"
time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')

CSV.open("#{time}_tickers.csv", "wb") do |file|
	# Column Titles
  row_headings = ["id", "ticker"]
  file << row_headings.unshift("Countries")

	countries.length.times do |i|
    # add row
    row = []
    store_languages.keys.each do |key|
      row << store_languages[key.to_sym][i]
    end
		file << row.unshift(countries[i])
	end
end
