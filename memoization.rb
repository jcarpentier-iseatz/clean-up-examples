class Example
  def underbelly_crappy
    if !@the_underbelly
      @the_underbelly = Array.new
    end
    @the_underbelly
  end

  def underbelly
    @the_underbelly ||= []
  end
end


# mculp-iseatz:examples matthew$ ruby memoization.rb 
#       user     system      total        real
# underbelly_crappy  0.350000   0.000000   0.350000 (  0.383521)
# underbelly  0.330000   0.000000   0.330000 (  0.355791)


# mculp-iseatz:examples matthew$ rvm use 1.9.2-p0
# info: Using ruby 1.9.2 p0
# mculp-iseatz:examples matthew$ ruby memoization.rb 
#       user     system      total        real
# underbelly_crappy  0.180000   0.000000   0.180000 (  0.193722)
# underbelly  0.190000   0.000000   0.190000 (  0.192795)


require 'benchmark'

example = Example.new

Benchmark.bm do |b|
  b.report("underbelly_crappy") do
    1_000_000.times { example.underbelly_crappy }
  end
  
  b.report("underbelly") do
    1_000_000.times { example.underbelly }
  end
end
