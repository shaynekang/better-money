require './lib/better_money/analyzer'

def better_money(amount)
  analyzer = BetterMoney::Analyzer.new(amount)

  analyzer.currency_symbol + analyzer.value.to_s + analyzer.unit_symbol
end