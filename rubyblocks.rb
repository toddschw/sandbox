# example of simple yielding
# a method yields to a block

def my_method
  puts "Inside the method begining line"
  yield
  puts "Inside the method last line"
end

my_method do
  puts "Inside the yield"
end

# example of yielding where
# method passes block parameters

def my_method_2
  puts "Inside the method beginning line"
  yield("foo","bar")
  puts "Inside the method last line"
end

my_method_2 do |foo, bar|
  puts "The #{foo} is #{bar}"
end

# example of using block.call instead of yield.
# also using &block (or &whatever) allows us to
# reference the block as an object

def my_method_3(&block)
  puts block
  block.call #meaningwise- same as yield
end

my_method_3 do
  puts "Hello!"
end

# example where yield returns the value of the last
# expression in the yeild statement

def my_method_4
  puts "First line inside method"
  yield
  foo = yield
  puts "Last line inside method, foo = #{foo}"
end

my_method_4 do
  puts "Inside the yield (will be printed twice)"
  4
end
