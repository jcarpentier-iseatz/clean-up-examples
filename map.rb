class Example
  def initialize
    require 'ostruct'
    @hotel_room = OpenStruct.new
    @hotel_room.promotions = [OpenStruct.new(:description => 'description')] * 25
  end

  def room_promotions
    promos = []
    @hotel_room.promotions.each do |promo|
      promos << promo.description
    end
    promos
  end
  
  def room_promotions_with_map_and_symbol_to_proc
    @hotel_room.promotions.map(&:description)
  end
  
  def room_promotions_with_map
    @hotel_room.promotions.map { |r| r.description }
  end
end

# ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]
# mculp-iseatz:examples matthew$ ruby map.rb
#
#
#       user     system      total        real
# map(&:)  3.140000   0.010000   3.150000 (  3.353198)
# map  2.590000   0.010000   2.600000 (  2.828603)
# <<  3.000000   0.010000   3.010000 (  3.617244)



# ruby 1.9.2p0 (2010-08-18 revision 29036) [x86_64-darwin10.4.0]
# mculp-iseatz:examples matthew$ ruby map.rb
# 
#
# user     system      total        real
# map(&:)  0.690000   0.010000   0.700000 (  0.724870)
# map  0.870000   0.000000   0.870000 (  0.929773)
# <<  0.930000   0.010000   0.940000 (  1.009339)


require 'benchmark'

example = Example.new

Benchmark.bm do |b|
  b.report("map(&:)") do
    100_000.times { example.room_promotions_with_map_and_symbol_to_proc }
  end
  
  b.report("map") do
    100_000.times { example.room_promotions_with_map }
  end

  b.report("<<") do
    100_000.times { example.room_promotions }
  end
end
