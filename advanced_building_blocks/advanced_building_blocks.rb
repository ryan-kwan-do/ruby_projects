class Array

  def bubble_sort
  	change = true
  	while change == true
  	  change = false
  	  self.each_index do |index|
  	    if self[index + 1] && self[index] > self[index+1]
  	      self[index], self[index+1] = self[index+1], self[index]
  	  	  change = true
  	    end
  	  end
  	end
  	self
  end

  def my_each
  	i = 0
  	while i < self.size
  		yield self[i]
  		i += 1
  	end
  end

  def my_each_with_index
  	i = 0
  	while i < self.size
  	  yield self[i], i
  	  i += 1
  	end
  end

end