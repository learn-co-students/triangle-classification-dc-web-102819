class Triangle
  attr_reader  :a, :b, :c

  def initialize(a=nil, b=nil, c=nil)
  	@a = a
  	@b = b
  	@c = c
  end

  def kind

  	sides_by_length = [a,b,c].sort
  	
  	validate = sides_by_length[0] + sides_by_length[1] > sides_by_length[2]

  	if [a,b,c].any? {|side| side <= 0}
		validate = false
  	end

  	if !validate
  		raise TriangleError
  	end

  	if self.a == self.b and self.b == self.c
  		:equilateral
  	elsif self.a == self.b or self.b == self.c or self.a == self.c
  		:isosceles
  	else#if self.a != self.b && self.b != self.c && self.a != self.c
  		:scalene
  	# else
  		# Triangle.error
  	end
  end

  class TriangleError < StandardError
  	def message
  		"Sorry, that's not a triangle!"
  	end
  end

end
