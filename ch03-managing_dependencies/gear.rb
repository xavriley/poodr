class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end

  # ^^^^^^^^^^^^^^^^^
  # Remove Argument-Order Dependencies
  #   if you have control of the initialize,
  #   use a hash to maintain decoupling of 
  #   dependencies

  def gear_inches
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end

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

Gear.new({:chainring => 52, 
          :cog => 11, 
          :wheel => Wheel.new(26, 1.5)).gear_inches
