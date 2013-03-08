class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    #@chainring / @cog.to_f <------ road to ruin
    chainring / cog.to_f
  end
end

# Write code that embraces change
# - Depend on behaviour, not data
#     Wrap instance variables in methods to DRY them up.
#     Their behaviour can be changed in one place
