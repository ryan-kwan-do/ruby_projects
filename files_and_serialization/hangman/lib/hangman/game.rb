module Hangman
  class Game

  	attr_accessor :word

    def initialize(output)
      @output = output
      @word
    end

    def start_new_game
      @output.puts 'Welcome to Hangman!'
      @word = Word.new.new_word
    end
  end
end