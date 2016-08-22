module Hangman
  class Game

  	attr_accessor :word, :guess_array
  	attr_reader :guesses

    def initialize(output)
      @output = output
      @guess_array = []
      @guesses = 9
    end

    def start_new_game
      @output.puts 'Welcome to Hangman!'
      @word = Word.new.new_word
      display_board
      display_guesses
    end

    def display_guesses
      @output.puts 'You can make ' + @guesses.to_s + ' more mistakes before the man hangs.'
    end

    def display_board
      board = Board.new(@word, @guess_array)
      @output.puts board.reveal_correct_guesses.join(' ')
    end
  end
end