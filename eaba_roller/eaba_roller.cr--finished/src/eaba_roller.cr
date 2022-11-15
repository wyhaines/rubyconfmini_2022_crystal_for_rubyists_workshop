require "./roller"

module EabaRoller
  VERSION = "0.1.0"

  def self.run
    roller = Roller.new(ARGV)
    puts "Rolling #{roller.rolls.size} dice, and keeping the best #{roller.best}:"
    puts "  #{roller.best_rolls.join(", ")}"
    puts "  Total: #{roller.total}"
  end
end
