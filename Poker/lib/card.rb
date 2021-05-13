class Card
    attr_reader :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

    def to_i
      case value
      when 2..10
        return value
      when 'J'
        return 11
      when 'Q'
        return 12
      when 'K'
        return 13
      when 'A' 
        return 14
      end
    end
end