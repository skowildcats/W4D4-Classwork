require 'card.rb'

describe Card do
    let (:card) {Card.new(:diamond, 8)}
    describe "#initialize" do
      it "Should accept a suit and a value" do
        expect(card.suit).to be(:diamond)
        expect(card.value).to eq(8)
      end
    end
end