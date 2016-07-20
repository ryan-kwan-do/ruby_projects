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

end