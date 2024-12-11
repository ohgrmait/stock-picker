def stock_picker(stock_prices)
  biggest_profit = 0
  best_day_to_buy = 0
  best_day_to_sell = 1

  stock_prices.each_with_index do |stock_price, day|
    next if day == 0
    past_stock_prices = stock_prices[0, day]
    past_stock_prices.each_with_index do |past_stock_price, past_day|
      current_profit = stock_price - past_stock_price
      if current_profit > 0 && current_profit > biggest_profit
        biggest_profit = current_profit
        best_day_to_buy = past_day
        best_day_to_sell = day
      end
    end
  end

  if biggest_profit > 0
    [best_day_to_buy, best_day_to_sell]
  else
    "stay away from the stock market"
  end
end