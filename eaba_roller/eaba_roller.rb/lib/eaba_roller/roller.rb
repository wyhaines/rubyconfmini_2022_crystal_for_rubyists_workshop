require_relative "./d6"

class Roller
  attr_accessor :rolls, :best

  # Takes 0, 1, or 2 arguments. If the first argument is an array, the
  # array is assumed to contain string arguments from the command line.
  # Otherwise, dice is the number of dice to roll, and best specifies
  # how many of the best dice are kept to determine the total.
  def initialize(dice = 3, best = 3)
    if dice.is_a?(Hash)
      best = dice[:best] || 3
      dice = dice[:dice] || 3
    elsif dice.is_a?(Array)
      case dice.size
      when 0
        dice = 3
      when 1
        dice = dice[0].to_i
      when 2
        best = dice[1].to_i
        dice = dice[0].to_i
      end
    end

    self.best = best
    @rolls = []
    dice.times { @rolls << D6.new.roll }
  end

  # Returns an array with just the best rolls.
  def best_rolls
    rolls.sort.last(best)
  end

  # Returns the total of the best rolls.
  def total
    best_rolls.inject(0) {|sum, die| sum += die}
  end
end
