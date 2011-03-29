# symbols are never GC'd - so don't create dynamic symbols
1_000_000.times do |i|
  some_method("hello_number_#{i}")
end

# symbols are never GC'd - so :hello will already be in memory for each iteration
1_000_000.times do
  some_method(:hello)
end

# most libraries don't care whether you pass it string or symbol
select_tag :hello
select_tag "hello_number_#{i}"

# so use responsibly!
