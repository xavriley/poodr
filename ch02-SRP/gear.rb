class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # tire goes around rim twice for diameter
    ratio * (rim + (tire *2))
  end
end

#This change works but breaks the previous interface

#puts Gear.new(52, 11i, 26, 1.5).ratio
#puts Gear.new(52, 11, 24, 1.25).ratio
