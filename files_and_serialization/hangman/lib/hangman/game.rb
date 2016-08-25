require 'pstore'

module Hangman
  class Game

  	attr_accessor :word, :guess_array
  	attr_reader :allowed_guesses

    def initialize(output)
      @output = output
      @guess_array = []
      @allowed_guesses = 9
    end

    def player_chooses_new_or_old(decision)
      if decision.downcase == 'y' && File.exist?("savedgame")
      	load_game
      elsif decision.downcase == 'y'
        @output.puts 'No saved game exists. Starting a new game!'
        start_new_game	       
      else
      	start_new_game
      end
    end

    def start_new_game
      @output.puts 'Welcome to Hangman!'
      @output.puts "Type 'save' at the beginning of any turn to save your game for later."
      @word = Word.new.new_word
      display_board
      display_guesses
    end

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

      save_game if guess == 'save'

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

    def save_game
      store = PStore.new("savedgame")
      store.transaction do
      	store[:word] = Array.new
      	store[:word] << @word

      	store[:guess_array] = Array.new
      	store[:guess_array] << @guess_array

      	store[:allowed_guesses] = Array.new
      	store[:allowed_guesses] << @allowed_guesses
      end
    @output.puts 'Game saved! Bye!'
    exit(false)
    end

    def load_game
      store = PStore.new("savedgame")
      store.transaction do
      	@word = store[:word][-1].to_s
      	@guess_array = store[:guess_array][-1]
      	@allowed_guesses = store[:allowed_guesses][-1]
      end
      @output.puts 'Saved game loaded!'
      display_board
      display_guesses
    end
  end
end