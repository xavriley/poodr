class Gear
  attr_reader :chainring, :cog, :wheel
  # Explicitly define defaults
  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog       = args[:cog]       || 18
    @wheel     = args[:wheel]
    # but watch out for hashes with truthy values...
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
