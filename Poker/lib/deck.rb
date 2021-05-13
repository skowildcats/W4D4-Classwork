require_relative 'card.rb'

class Deck
    SUITS = [:diamond, :club, :heart, :spade]
    VALUE = (2..10).to_a + ['J','Q','K','A']
    
    attr_reader :deck
    
    def initialize
      @deck = []
      VALUE.each do |val|
        SUITS.each do |suit|
          @deck << Card.new(suit, val)
        end
      end
    end
end
