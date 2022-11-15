require "./d6"

class Roller
  getter rolls : Array(Int32) = Array(Int32).new
  getter best : Int32

  def initialize(args : Array(String))
    case args.size
    when 0
      initialize
    when 1
      initialize(args[0].to_i)
    else
      initialize(args[0].to_i, args[1].to_i)
    end
  end

  def initialize(dice = 3, @best = 3)
    dice.times { rolls << D6.new.roll }
  end

  def best_rolls
    rolls.sort.last(best)
  end

  def total
    best_rolls.reduce(0) {|sum, die| sum += die}
  end
end
