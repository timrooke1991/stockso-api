# require 'open-uri'
# require 'nokogiri'
# require 'mechanize'
#
# mechanize = Mechanize.new
# tickers = []
# last_page = 210;
# current_page = 1;
# url = "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=1"
#
# until current_page > last_page
#
#   page = mechanize.get("http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=#{current_page}")
#
#
#   rows = page.css('table tr td:first-child').to_s
#   rows.split('</td>').map! { |stock|
#           stock
#             .tr('<td scope=\"row\" class=\"name\">', '')
#             .tr('.', '')
#
#           Share.create!(ticker: stock)
#         }
#
#   current_page += 1
# end
