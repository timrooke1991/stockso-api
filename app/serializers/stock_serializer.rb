class StockSerializer < ActiveModel::Serializer
  attributes :ticker, :percentage_held, :stock_info, :sentiment

  def stock_info
    stock_info = {}
    stock_info.merge!(ask: MarketBeat.ask("#{object.ticker.downcase}.L"))
    stock_info.merge!(bid: MarketBeat.bid("#{object.ticker.downcase}.L"))
    # stock_info.merge!(last_trade_real_time: MarketBeat.last_trade_real_time("#{object.ticker.downcase}.L"))
    # stock_info.merge!(annualized_gain: MarketBeat.annualized_gain("#{object.ticker.downcase}.L"))
    # stock_info.merge!(days_high: MarketBeat.days_high("#{object.ticker.downcase}.L"))
    # stock_info.merge!(days_low: MarketBeat.days_low("#{object.ticker.downcase}.L"))
    # stock_info.merge!(change: MarketBeat.change("#{object.ticker.downcase}.L"))
    stock_info.merge!(change_from_200_day_moving_average: MarketBeat.change_from_200_day_moving_average("#{object.ticker.downcase}.L"))
    stock_info.merge!(change_from_50_day_moving_average: MarketBeat.change_from_50_day_moving_average("#{object.ticker.downcase}.L"))
    stock_info.merge!(change_from_52_week_high: MarketBeat.change_from_52_week_high("#{object.ticker.downcase}.L"))
    stock_info.merge!(change_from_52_week_low: MarketBeat.change_from_52_week_low("#{object.ticker.downcase}.L"))
    # stock_info.merge!(market_capitalization: MarketBeat.market_capitalization("#{object.ticker.downcase}.L"))
    # stock_info.merge!(more_info: MarketBeat.more_info("#{object.ticker.downcase}.L"))
    stock_info.merge!(moving_average_200_day: MarketBeat.moving_average_200_day("#{object.ticker.downcase}.L"))
    stock_info.merge!(moving_average_50_day: MarketBeat.moving_average_50_day("#{object.ticker.downcase}.L"))
    stock_info.merge!(pe_ratio: MarketBeat.pe_ratio("#{object.ticker.downcase}.L"))
    stock_info.merge!(range_52_week: MarketBeat.range_52_week("#{object.ticker.downcase}.L"))
    stock_info.merge!(dividend_yield: MarketBeat.dividend_yield("#{object.ticker.downcase}.L"))
    stock_info.merge!(ex_dividend_date: MarketBeat.ex_dividend_date("#{object.ticker.downcase}.L"))
    # stock_info.merge!(quotes: MarketBeat.quotes("#{object.ticker.downcase}.L"))
    # stock_info.merge!(symbol: MarketBeat.symbol("#{object.ticker.downcase}.L"))
    # stock_info.merge!(volume: MarketBeat.volume("#{object.ticker.downcase}.L"))
    # stock_info.merge!(stock_exchange: MarketBeat.stock_exchange("#{object.ticker.downcase}.L"))
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
