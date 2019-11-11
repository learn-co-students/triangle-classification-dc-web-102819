class Triangle
  attr_reader  :a, :b, :c

  def initialize(a=nil, b=nil, c=nil)
  	@a = a
  	@b = b
  	@c = c
  end

  def kind

  	sides_by_length = [a,b,c].sort
  	#if the sum of any two sides MUST be longer than the third
  	#that means that he sum of the shortest two sides
  	#MUST be longer than the longest side
  	validate = sides_by_length[0] + sides_by_length[1] > sides_by_length[2]

  	if [a,b,c].any? {|side| side <= 0}
  		#if any sides are less than or equal to zero the validation will fail
		validate = false
  	end

  	if !validate
  		raise TriangleError
  	end

  	if self.a == self.b and self.b == self.c
  		:equilateral
  	elsif self.a == self.b or self.b == self.c or self.a == self.c
  		:isosceles
  	else
  		:scalene
  	end
  end

  class TriangleError < StandardError
  	def message
  		"Sorry, that's not a triangle!"
  	end
  end

end
