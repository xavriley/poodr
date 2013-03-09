class Gear
  attr_reader :chainring, :cog, :wheel
  # Explicitly define defaults
  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
    # implementing a defaults method has the same
    # benefits as fetch - will only set defaults
    # if the key is nil
    # This is also good if the defaults get more
    # complex
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

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
