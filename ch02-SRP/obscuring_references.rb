class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    data.collect {|cell|
      cell[0] + (cell[1] * cell[2])}
  end
end

# this depends on a data structure
# references to the data's structure are _leaky_
