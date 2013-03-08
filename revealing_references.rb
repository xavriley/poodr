class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # first iterate over the array
  def diameters
    wheels.collect {|wheel| diameter(wheel) }
  end

  # second - calculate the diameter of ONE wheel
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      Wheel.new(cell[0], cell[1])}
  end
end

# Hide Data Structures
# The diameters method no longer has knowledge of the internal structure of the data array
# What were once references to cell[1] have been transformed into message sends to wheel.tire
#
# Enfore Single Responsibility Everywhere
# Extract extra responsibilities from methods
