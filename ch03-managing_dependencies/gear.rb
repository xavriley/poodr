class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def gear_inches
    # Imagine some scary maths
    ratio * diameter
    # Imagine some more scary maths
  end

  def ratio
    chainring / cog.to_f
  end

  # Isolate the dependency into it's own method
  # This welcomes change and refactoring later
  def diameter
    wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  #...
end

Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
