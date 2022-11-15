class D6
  property value : Int32 = 0

  def roll
    value > 0 ? value : self.value = rand(1..6)
  end

  def to_s
    roll.to_s
  end

  def to_s(io)
    io << to_s
  end

  def inspect(io)
    io << to_s
  end
end
