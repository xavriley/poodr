class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end

  # ...
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

Gear.new(52, 11, 26, 1.5).gear_inches

#Recognizing dependencies
#  An object has a dependency when it knows:
#    the name of another class
#    the name of a message that it intends to send to someone other than self
#    the arguments a message requires
#    the order of those arguments
#
#    eg
#
#    Gear expects a class named Wheel
#    " expects it to respond to diameter
#    " expects new to take a rim and a tire
#    " expects arg1 to be rim, arg2 to be tire
