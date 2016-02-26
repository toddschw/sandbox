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
