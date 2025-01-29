# step 1 --------------------------
# class Gear
#   attr_reader :chain_ring, :cog

#   def initialize(chain_ring, cog)
#     @chain_ring = chain_ring
#     @cog = cog
#   end

#   def ratio
#     chain_ring/cog.to_f
#   end
# end

# puts Gear.new(52,11).ratio
# puts Gear.new(30,27).ratio


# step 2 -------------------------- add more feature to calculate the gear_inches

# class Gear
#   attr_reader :chain_ring, :cog, :rim_diameter, :tire_diameter

#   def initialize(chain_ring, cog, rim_diameter, tire_diameter)
#     @chain_ring = chain_ring
#     @cog = cog
#     @rim_diameter = rim_diameter
#     @tire_diameter = tire_diameter
#   end

#   def wheel_diameter
#     rim_diameter + (2 * tire_diameter)
#   end

#   def gear_inches
#     wheel_diameter * ratio
#   end
#   def ratio
#     chain_ring/cog.to_f
#   end
# end

# puts Gear.new(52,11, 26, 1.5).gear_inches
# puts Gear.new(52,11, 24, 1.25).gear_inches
# puts Gear.new(30,27),ratio0 # it fails


# # step 3 -------------------------- introduce wheel without creating new class.

# class Gear
#   attr_reader :chain_ring, :cog, :wheel

#   def initialize(chain_ring, cog, rim_diameter, tire_diameter)
#     @chain_ring = chain_ring
#     @cog = cog
#     @wheel = Wheel.new(rim_diameter, tire_diameter)
#   end
  
#   def gear_inches
#     wheel.diameter * ratio
#   end

#   def ratio
#     chain_ring/cog.to_f
#   end

#   Wheel = Struct.new(:rim_diameter, :tire_diameter) do
#     def diameter
#       rim_diameter + (2 * tire_diameter)
#     end
#   end
# end

# puts Gear.new(52,11, 26, 1.5).gear_inches
# puts Gear.new(52,11, 24, 1.25).gear_inches




# step 3 -------------------------- introducing single responsible  classes


class Wheel
  attr_reader :rim_diameter, :tire_diameter
  def initialize(rim_diameter, tire_diameter)
    @rim_diameter = rim_diameter
    @tire_diameter = tire_diameter
  end

  def diameter
    rim_diameter + 2 * tire_diameter
  end

  def circumference
    diameter * Math::PI
  end
end

class Gear
  attr_reader :chain_ring, :cog, :wheel

  def initialize(chain_ring, cog, wheel=nil)
    @chain_ring = chain_ring
    @cog = cog
    @wheel = wheel
  end
  
  def gear_inches
    wheel.diameter * ratio
  end

  def ratio
    chain_ring/cog.to_f
  end
end

big_wheel = Wheel.new(26,1.5)
small_wheel = Wheel.new(24, 1.25)
puts Gear.new(52,11, big_wheel).gear_inches
puts Gear.new(52,11, small_wheel).gear_inches
puts Gear.new(30,27).ratio