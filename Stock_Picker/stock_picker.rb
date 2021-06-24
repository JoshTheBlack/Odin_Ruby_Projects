require "pry"

def stock_picker(prices)
    best = [0]
    initial_prices = prices.map(&:clone)
    prices.length.times do
        buy = prices[0]
        prices.each do |price|
            if price - buy > best[0]
                best[0] = price - buy
                best[1] = buy
                best[2] = price
            end
        end
        prices.shift
    end
    result = [initial_prices.index(best[1]),initial_prices.index(best[2])]
end

if __FILE__ == $0
    p stock_picker([17,3,6,9,15,8,6,1,10])
end