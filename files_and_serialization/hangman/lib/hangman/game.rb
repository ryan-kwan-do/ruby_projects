module Hangman
  class Game

  	attr_accessor :word, :guess_array
  	attr_reader :allowed_guesses

    def initialize(output)
      @output = output
      @guess_array = []
      @allowed_guesses = 9
    end

    def start_new_game
      @output.puts 'Welcome to Hangman!'
      @word = Word.new.new_word
      display_board
      display_guesses
    end

    #need to create "allowed guess count function"
    def display_guesses
      @output.puts 'You can make ' + @allowed_guesses.to_s + ' more mistakes before the man hangs.'
    end

    def display_board
      board = Board.new(@word, @guess_array)
      @output.puts board.reveal_correct_guesses.join(' ')
    end

    def duplicate_guess?(guess)
      @guess_array.include?(guess.downcase)
    end

	# Checks if guess is more than one letter long
    def bad_guess?(guess)
      guess.length != 1
    end

    def correct_guess?(guess)
      @word.split('').include?(guess)
    end
    #matches guess_array to word
    def player_lose?
      @allowed_guesses == 0 ? true : false
    end

    def player_win?
      truth = []
      @word.split('').each { |letter| truth << @guess_array.include?(letter) }
      truth.all?
    end

    def gameover
      @output.puts 'Gameover! You failed to stop the hanging!'
      exit(false)
  	end

  	def victory
  	  @output.puts 'You win!'
  	  exit(false)
  	end

  	def get_valid_guess(guess)
  	  while duplicate_guess?(guess) || bad_guess?(guess)
		if duplicate_guess?(guess)
		  @output.puts "You already guessed that letter!"
		  guess = gets.chomp.downcase
		elsif bad_guess?(guess)
		  @output.puts "Bad guess. Enter a different letter:"
		  guess = gets.chomp.downcase
		end
	  end
    end

    def evaluate_guess(guess)
      if correct_guess?(guess)
      	@output.puts "Correct!"
      else
      	@output.puts "Incorrect guess!"
      	@allowed_guesses -= 1
      	display_guesses
      end
    end

    def player_guess(guess)
      guess.downcase!

      get_valid_guess(guess)

      @guess_array << guess

      evaluate_guess(guess)

      if player_win?
      	victory
      elsif player_lose?
      	gameover
      end

      display_board
    end
  end
end