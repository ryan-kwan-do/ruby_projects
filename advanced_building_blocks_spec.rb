require_relative 'advanced_building_blocks'

  describe Array do
	let(:my_array) { Array.new([4,3,2,1,4]) }

	context '#bubble_sort' do
      it 'swaps an element with the index before it if it is larger' do
        expect(my_array.bubble_sort).to eql([1,2,3,4,4])
      end
  	end

  end

	