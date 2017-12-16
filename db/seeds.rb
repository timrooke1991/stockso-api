# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
require 'mechanize'

mechanize = Mechanize.new
tickers = []
last_page = 210;
current_page = 1;
url = "http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=1"

until current_page > last_page

  page = mechanize.get("http://www.londonstockexchange.com/exchange/prices-and-markets/stocks/main-market/main-market.html?&page=#{current_page}")


  rows = page.css('table tr td:first-child').to_s
  tickers = rows.split('</td>').map! { |stock|
          stock
            .tr('<td scope=\"row\" class=\"name\">', '')
            .tr('.', '')
        }

  tickers.each do |stock|
    Share.create!(ticker: stock)
  end
  
  current_page += 1
end
