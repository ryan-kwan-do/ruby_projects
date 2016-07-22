require_relative 'advanced_building_blocks'

  describe Array do
    let(:display_output) {double('display_output').as_null_object}
	  let(:my_array) { Array.new([4,3,2,1,4]) }

	context '#bubble_sort' do
      it 'swaps an element with the index before it if it is larger' do
        expect(my_array.bubble_sort).to eql([1,2,3,4,4])
      end
  	end

  	context '#my_each' do
  	  it 'iterates through an array' do
        new_array = [] 
        my_array.my_each{ |x| new_array << x }
        expect(new_array).to eql([4,3,2,1,4])
      end
    end

  	context '#my_each_with_index' do
  	  it 'iterates through an array and tracks the index' do
        new_array = []
        my_array.my_each_with_index { |x,y| new_array << (x + y)}
        expect(new_array).to eql([4,4,4,4,8])
      end
    end

  	context '#my_select' do
      it 'finds items in an array that match certain criteria' do
        new_array = []
        new_array = my_array.my_select { |x| x > 3 }
        expect(new_array).to eql([4,4])
      end
    end

  	context '#my_all?'  do
      it 'returns true if all items in array match criteria' do
        expect(my_array.my_all? { |x| x > 0 }).to eql true
      end

      it 'returns false if any of the items do not match' do 
        expect(my_array.my_all? { |x| x > 1}).to eql false
      end
    end

  	context '#my_any?'
  	context '#my_none?'
  	context '#my_count'
  	context '#my_map'
  	context '#my_inject'
  	context '#multiply_els'

  end

	