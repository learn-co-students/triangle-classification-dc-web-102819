class Triangle
  attr_reader  :a, :b, :c

  def initialize(a, b, c)
  	@a = a
  	@b = b
  	@c = c
  end

  def kind
	#fail if any side == nil
  	if [a,b,c].any? {|side| side == nil}
		validate = false
	#fail if any side <= 0
	elsif [a,b,c].any? {|side| side <= 0}
		validate = false
	#fail if the sum of any two is not longer than the third
  	else
	  	#that means that he sum of the shortest two sides
	  	sides_by_length = [a,b,c].sort
	  	#MUST be longer than the longest side
	  	validate = sides_by_length[0] + sides_by_length[1] > sides_by_length[2]
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
