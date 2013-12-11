module BetterMoney
  CURRENCY_SYMBOL = "$"
  UNIT_SYMBOL = ["", "k", "M", "B", "T"]
  SEPERATE_BY = 3

  class Analyzer
    def initialize(amount)
      @amount = amount
    end

    def currency_symbol
      @currency_symbol ||= CURRENCY_SYMBOL
    end

    def value
      @value ||= find_value(@amount)
    end

    def unit_symbol
      @unit_symbol ||= UNIT_SYMBOL[seperate_level]
    end

    def seperate_level
      @seperate_level ||= find_seperate_level(@amount)
    end

  private
    def find_seperate_level(amount)
      cipher = amount.to_i.to_s.length

      current_level = (cipher - 1) / SEPERATE_BY
      maximum_level = UNIT_SYMBOL.length

      [current_level, (maximum_level - 1)].min
    end

    def find_value(amount)
      divide_value = (10 ** SEPERATE_BY) ** seperate_level

      result = amount.to_f / divide_value
      result.round(2)
    end
  end
end