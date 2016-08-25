module Hangman
  class Board

  	def initialize(word, guess_array)
  	  @word, @guess_array = word, guess_array
  	  @output_array = []
  	  @show_man = Array.new
  	end

  	def reveal_correct_guesses
  	  word_array = @word.split('')
      word_array.each do |letter|
      	if @guess_array.include? letter
      	  @output_array << letter
      	else
      	  @output_array << '_'
      	end
      end
      @output_array
  	end
  end
end