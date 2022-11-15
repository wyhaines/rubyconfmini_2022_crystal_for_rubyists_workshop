require "./spec_helper"

describe EabaRoller do
  it "has a version number" do
    EabaRoller::VERSION.empty?.should be_false
  end

  it "can roll a die" do
    die = D6.new
    state = die.roll
    state.should be > 0
    state.should be < 7
    state.should eq die.roll
  end

  it "can do the standard roll (3 dice, best 3) with no arguments" do
    roller = Roller.new
    roller.best_rolls.size.should eq 3
    roller.rolls.size.should eq 3
    roller.total.should be > 2
    roller.total.should be < 19
  end

  it "can do a roll with many dice" do
    roller = Roller.new(dice: 7)
    roller.best_rolls.size.should eq 3
    roller.rolls.size.should eq 7
    roller.total.should be > 2
    roller.total.should be < 19
  end

  it "can do a roll with many dice, with more than the best 3" do
    roller = Roller.new(dice: 7, best: 4)
    roller.best_rolls.size.should eq 4
    roller.rolls.size.should eq 7
    roller.total.should be > 3
    roller.total.should be < 25

    sum = 0
    100000.times {sum += Roller.new(dice: 3, best: 3).total}
    (sum / 100000.0).should be_close(10.5, 0.2)

    sum = 0
    100000.times {sum += Roller.new(dice: 7, best: 4).total}
    (sum / 100000.0).should be_close(18.4, 0.2)
  end
end
