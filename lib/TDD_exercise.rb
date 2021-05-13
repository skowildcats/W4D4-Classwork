def my_uniq(arr)
    count = Hash.new(0)
    arr.each do |ele|
        count[ele]+=1
    end
    return count.keys

    # arr.select {|ele| ele.count == 1}
end

class Array
    def two_sum
        new_arr =[]
        (0..self.length - 1).each do |i|
          (i + 1..self.length - 1).each do |j|
            new_arr << [i, j] if self[i] + self[j] == 0
          end
        end
        new_arr
    end
end

def my_transpose(arr)
  new_arr = Array.new(arr.length) {Array.new(arr.length)}
  (0..arr.length - 1).each do |i|
    (0..arr.length - 1).each do |j|
      new_arr[j][i] = arr[i][j]
    end
  end
  new_arr
end

def stock_picker(arr)
    best_profit = 0
    best_profit_day1 = 0
    best_profit_day2 = 0
    (0..arr.length - 1).each do |i|
      (i + 1..arr.length - 1).each do |j|
        best_profit_day1, best_profit_day2, best_profit = i, j, arr[j] - arr[i] if arr[j] - arr[i] > best_profit
      end
    end
    return [best_profit_day1, best_profit_day2]
end

class Towers_Of_Hanoi

    attr_accessor :towers
    def initialize(arr)
        @towers = arr
    end

    def move(pos1, pos2)
      towers[pos2].push(towers[pos1].pop)
      towers
    end

    def won?
      towers.any? {|tower| tower == towers.flatten.sort.reverse}
    end

    def play
      until self.won?
        p "Enter rod that you want to move from"
        pos1 = input.gets.chomp 
        puts
        p 'Enter rod that you want to move to'
        pos2 = input.gets.chomp
        puts
        self.move(pos1, pos2)
      end
      print "You won!"
    end
end
