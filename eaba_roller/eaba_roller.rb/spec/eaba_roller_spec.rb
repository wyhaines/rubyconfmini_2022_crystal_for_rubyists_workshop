# frozen_string_literal: true

RSpec.describe EabaRoller do
  it "has a version number" do
    expect(EabaRoller::VERSION).not_to be nil
  end

  it "can roll a die" do
    die = D6.new
    state = die.roll
    expect(state).to be > 0
    expect(state).to be < 7
    expect(state).to eql die.roll
  end

  it "can do the standard roll (3 dice, best 3) with no arguments" do
    roller = Roller.new
    expect(roller.best_rolls.size).to eql 3
    expect(roller.rolls.size).to eql 3
    expect(roller.total).to be > 2
    expect(roller.total).to be < 19
  end

  it "can do a roll with many dice" do
    roller = Roller.new(dice: 7)
    expect(roller.best_rolls.size).to eql 3
    expect(roller.rolls.size).to eql 7
    expect(roller.total).to be > 2
    expect(roller.total).to be < 19
  end

  it "can do a roll with many dice, with more than the best 3" do
    roller = Roller.new(dice: 7, best: 4)
    expect(roller.best_rolls.size).to eql 4
    expect(roller.rolls.size).to eql 7
    expect(roller.total).to be > 3
    expect(roller.total).to be < 25

    sum = 0
    100000.times {sum += Roller.new(dice: 3, best: 3).total}
    expect(sum / 100000.0).to be_within(0.2).of(10.5)

    sum = 0
    100000.times {sum += Roller.new(dice: 7, best: 4).total}
    expect(sum / 100000.0).to be_within(0.2).of(18.4)
  end

end
