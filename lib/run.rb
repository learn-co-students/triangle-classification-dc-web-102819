require 'pry'
require_relative './triangle.rb'

equal = Triangle.new(5,5,5)
isosceles = Triangle.new(7, 7, 7)
scalene = Triangle.new(3, 12, 15)
failed = Triangle.new(10, 4, 5)

# puts "is equal"
# puts equal.type = :equilateral

binding.pry