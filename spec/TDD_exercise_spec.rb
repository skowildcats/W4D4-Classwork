require 'TDD_exercise'

describe "my_uniq(arr)" do
  context "Remove duplicates" do
    it "It should return a new array without duplicates" do
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
        expect(my_uniq(['a','c','a','b'])).to eq(['a','c','b'])
        expect(my_uniq([4,4,4,5,'a'])).to eq([4,5,'a'])
    end
  end
end

describe "#two_sum" do
  context "Finds pairs of positions where the elements at those positions sum to zero" do 
    it "it should return a array of positions" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "my_transpose(arr)" do
  context "Convert between the row-oriented and column-oriented representations of a matrix " do 
    it "it should return a 2d array where the row and columns are switched" do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8] ])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end
end

describe "stock_picker(arr)" do
  context "outputs the most profitable pair of days on which to first buy the stock and then sell the stock " do 
    it "it should return a pair of days" do
        expect(stock_picker([3, 7, 3, 2, 8, 9, 2])).to eq([3, 5])
    end
  end
end

describe "Towers of Hanoi" do
  let(:towers) { Towers_Of_Hanoi.new([[1,3,2,4], [5,6], []]) }

  describe "#move" do
    context "Move 1 disk at a time from one position to another" do
      it "Returns array of updated positions" do
        expect(towers.move(0, 1)).to eq([[1,3,2], [5,6,4], []])
      end
    end
  end

  describe "#won?" do
    context "Checks all the disks are in one position and are ordered from largest to smallest" do
      it "Returns true/false depending on if the user has won" do
        expect(Towers_Of_Hanoi.new([[6,5,4,3,2,1], [], []]).won?).to be true
      end
    end
  end
  
end
