class D6
  attr_accessor :value

  def roll
    self.value ? self.value : self.value = rand(1..6)
  end

  def to_s
    roll.to_s
  end

  def inspect
    to_s
  end
end
