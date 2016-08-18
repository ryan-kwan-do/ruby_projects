module Hangman
  class Word
  	def initialize(word = new_word)
  	  @word
  	end

  	def load_words
  	  word_array = []
  	  file = File.open("5desk.txt")
  	  file.each_line do |line| 
  	  	word_array << line[0..-2] unless line.size < 6 || line.size > 13
  	  end
  	  word_array
  	end

  	def new_word
  	  self.load_words[rand(load_words.size)]
  	end
  end
end