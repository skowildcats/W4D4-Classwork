require 'deck.rb'

describe Deck do
  let (:deck) {Deck.new}
    describe "#initialize" do
      it "Should create 52 card objects" do
        expect(deck.deck.length).to be(52)
        expect(deck.deck[2]).to be_instance_of(Card)
      end
    end
end

