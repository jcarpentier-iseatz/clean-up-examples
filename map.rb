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

#!/usr/bin/env ruby
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