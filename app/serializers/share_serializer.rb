class ShareSerializer < ActiveModel::Serializer
    attributes :ticker, :stock_info

    def stock_info
      stock = StockQuote::Stock.quote("#{object.ticker.downcase}:LON")
    end

    def percentage_held
      holders =  object.posts.map{ |post| post.holder }.count(true)
      unless holders == 0 then holders.to_f / object.posts.length end
    end

    def sentiment
      sum_of_sentiment = object.posts.map{ |post| post.sentiment }.reduce(:+)
      sum_of_sentiment.to_f / object.posts.length
    end
end
