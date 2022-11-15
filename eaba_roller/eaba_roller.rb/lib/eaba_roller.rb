# frozen_string_literal: true

require_relative "eaba_roller/version"
require_relative "eaba_roller/roller"

module EabaRoller
  class Error < StandardError; end

  def self.run
    roller = Roller.new(ARGV)
    puts "Rolling #{roller.rolls.size} dice, and keeping the best #{roller.best}:"
    puts "  #{roller.best_rolls.join(", ")}"
    puts "  Total: #{roller.total}"
  end
end
