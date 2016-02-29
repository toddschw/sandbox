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
    "inside the sayHi method of MyClass"
  end
end

class MyInheritedClass < MyClass
  def sayHi
    puts super
    "saying Hi from MyInheritedClass"
  end
end

ob = MyClass.new
# puts ob.sayHi

ob2 = MyInheritedClass.new
puts ob2.sayHi
