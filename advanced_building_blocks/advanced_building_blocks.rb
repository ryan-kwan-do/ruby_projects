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
  	for i in 0..self.size - 1
  		yield self[i]
  	end
  end

  def my_each_with_index
  	i = 0
  	while i < self.size
  	  yield self[i], i
  	  i += 1
  	end
  end

#making use of the original my_each to be lazier
  def my_select
  	return_array = []
  	my_each { |x| return_array << x if yield(x)}
  	return_array
  end

  def my_all?
  	return_array = []
  	my_each { |x| return_array << 0 if !yield(x)}
  	return_array.include?(0) ? false : true
  end

#building this one from scratch just for kicks
  def my_any?
  	return_array = []
  	i = 0
  	while i < self.size
  	  yield(self[i]) ? return_array << 1 : return_array << 0
  	  i += 1
  	end
  	return_array.include?(1)
  end

#the opposite of my_any?
  def my_none?
    !self.my_any? {|x| yield(x)}
  end

  def my_count(value = nil)
  	i = 0
  	if block_given?
  	  my_each {|x| i+=1 if yield(x)}
  	elsif !value
  	  i = self.size
  	else
  	  my_each do |x|
  	  	i += 1 if x == value
  	  end
  	end
  	i
  end

end