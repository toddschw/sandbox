# Examples from the Book of Ruby by Huw Collingbourne

# class MyClass
#   @@classvar = 1000
#   @instvar = 500
#
#   def self.classMethod
#     if @instvar == nil then
#       @instvar = 10
#     else
#       @instvar += 10
#     end
#
#     if @@classvar == nil then
#       @@classvar = 10
#     else
#       @@classvar += 10
#     end
#   end
#
#   def instanceMethod
#     if @instvar == nil then
#       @instvar = 1
#     else
#       @instvar += 1
#     end
#
#     if @@classvar == nil then
#       @@classvar = 1
#     else
#       @@classvar += 1
#     end
#   end
#
#   def showVars
#     return "(instance method) @instvar = #{@instvar}, @@classvar = #{@@classvar}"
#   end
#
#   def self.showVars
#     return "(class method) @instvar = #{@instvar}, @@classvar = #{@@classvar}"
#   end
#
# end
#
# for i in 0..2 do
#   ob = MyClass.new
#   ob.instanceMethod
#   MyClass.classMethod
#   puts ob.showVars
#   puts MyClass.showVars
#
# end


class MyClass

  def self.classMethod
    @instvar = "foo"
    @instvar << " - this is the class instance variable"
  end

  def instanceMethod
    @instvar = "bar"
    @instvar << " - this is the object instance variable"
  end

end

puts MyClass.classMethod
ob = MyClass.new
puts ob.instanceMethod


class MyClass2

  @instalk

  def self.classMethod
    @instvar = "too"
  end


end

puts MyClass2.classMethod
puts MyClass2.instance_variables

class MyClass3
  def self.new (aStr)
    super
    @anewvar = aStr.swapcase
  end

  def initialize (aStr)
    @avar = aStr
  end
end

ob = MyClass3.new("hello world")
puts ob
puts ob.class

p IO.singleton_methods


class Creature
  def initialize (aSpeech)
    @speech = aSpeech
  end

  def talk
    puts @speech
  end
end

cat = Creature.new( "miaow" )
dog = Creature.new( "woof" )
budgie = Creature.new( "Who's a pretty boy, then!" )
werewolf = Creature.new( "growl" )

def werewolf.howl
  puts "Yooowww"
end

werewolf.howl

class Person
end

neo = Person.new

def neo.seeMatrix
  puts "I am the one!"
end

person = Person.new


if person.singleton_methods.include? ("congratulate")
  person.seeMatrix
end

if neo.respond_to? (:seeMatrix)
  neo.seeMatrix
end


ob1 = Object.new
puts ob.object_id

class << ob1
  def bark
    puts "woof"
  end
end

ob2 = Object.new

puts ob1.methods - ob2.methods

class MyClass
  def sayHello
    puts "Hello from MyClass"
  end

  def sayGoodbye
    return "Goodbye from MyClass"
  end
end

class MyOtherClass < MyClass
  def sayHello
    puts "Hello from MyOtherClass"
  end

  def sayGoodbye
    puts super << " and also from MyOtherClass"
  end

  def to_s
    return "I am an instance of #{self.class}"
  end
end

ob = MyClass.new
ob.sayHello
puts ob.sayGoodbye
puts ob.to_s

obj = MyOtherClass.new
obj.sayHello
obj.sayGoodbye
puts obj.to_s


def method
  p "hi"
end

a = method

puts a.class

class MyClass
  def sayHi
    a = "inside the sayHi method of MyClass"
    nil
  end
end

class MyInheritedClass < MyClass
  def sayHi
    super
    puts a
  end
end

ob = MyClass.new
# puts ob.sayHi

ob2 = MyInheritedClass.new
# puts ob2.sayHi


class ToddClass


  def self.sayHi
    puts "Hii..."
  end

  sayHi

  private
    def priv
      puts self
    end

  protected
    def prot
      puts "protected"
    end

  public
    def pub
      puts "public"
    end

    def useOb (anOb)
      priv
    end


end

5.times do
  puts self.class
  myob = ToddClass.new
end
# myob2 = ToddClass.new

# myob.useOb (myob2)


def roar
  puts "rooooar"
end

def sing
  puts "la"
end

puts Object.methods.private_methods.sort

puts self.object_id
puts self.object_id

class Array

  puts self

  def self.laugh
    puts self.object_id
  end

  def growl
    puts "instance var growl #{self.object_id}"
  end

end

[1,2].growl
Array.laugh

def self.bray
  puts "he haw"
end

self.bray

puts
puts

puts Object.methods.count
puts self.methods.count

y = Object.new

def y.smile
  puts self
  puts "smile"
end

y.smile

arr = [11,-3,4, 8, 0,0,5,-1,67]
n = arr.length

myhash = {less: [], greater: [], zero: []}
for y in 0..n-1
  if arr[y] < 0
    puts "less than case:  element #{y} is #{arr[y]}"
    myhash[:less] << arr[y]
  elsif arr[y] > 0
    puts "greater than case:  element #{y} is #{arr[y]}"
    myhash[:greater] << arr[y]
  else
    puts "0 case:  element #{y} is #{arr[y]}"
    myhash[:zero] << arr[y]
  end
end

puts myhash[:greater].length.to_f/n.to_f
puts myhash[:less].length.to_f/n.to_f
puts myhash[:zero].length.to_f/n.to_f

m = 6
for i in 1..m

  (m-i).times { print " "}
  i.times { print "*"}
  puts
end

date = "07:05:45PM"

# puts date.slice(-2..-1)
# puts date
#
# puts date.slice!(-2..-1)
# puts date

def format_date(date)
  am_or_pm = date.slice -2..-1
  less_stamp = date.slice(0..7)
  hour = date.slice 0..1
  hour = hour.to_i
  if am_or_pm == "AM"
    if hour == 12 # subtract 12
      hour = "00"
      puts hour << date.slice(2..7)
    else
      puts date.slice(0..7)
    end
  else
    if hour != 12
      hour = hour + 12
      hour = hour.to_s
      puts  hour << date.slice(2..7)
    else
      hour = hour + 1
      hour = hour.to_s
      puts  hour << date.slice(2..7)
    end
  end
end

format_date("12:05:45AM")
format_date("12:45:45PM")

arr = [2,5,6,22,33,2,90,31]
n = arr.length

n.times do
    arr << gets.strip.to_i
end

def results(n,arr)
    return_array = []
    for i in 1..n
        puts "Game #{i} begin: goal is to reach block #{arr[i-1]}"
        lands_on = 0
        for move in 1..arr[i-1]
           print "move #{move} "
           lands_on += move
           if lands_on > arr[i-1]
           #           return_array << "Better Luck Next Time"
             puts "Game Over"
             break
           elsif lands_on == arr[i-1]
           #           return_array << "Go On Bob #{lands_on}"
             puts "Winner"
             break
           end

         end
         puts
      end
  end

results n, arr
