require 'spec_helper'
require 'stringio'

module Hangman
  describe Game do
  	let(:display_output) { double('display_output').as_null_object }
  	let(:game) { Game.new(display_output)}  	  

  	describe '#start_new_game' do
  	  it 'displays a welcome message' do
  	  	expect(display_output).to receive(:puts).with('Welcome to Hangman!')
  	  	game.start_new_game
  	  end
  	  it 'assigns a word from the dictionary to word' do
  	  	game.start_new_game
  	  	expect(game.word).to be_a(String)
  	  end
  	  it 'displays the remaining number of incorrect guesses' do
  	  	expect(display_output).to receive(:puts).with('You can make 9 more mistakes before the man hangs.')
  	  	game.start_new_game
  	  	expect(game.allowed_guesses).to eql 9	  	
  	  end	
  	end
  	describe '#display_board' do
  	  it 'outputs the current board' do
  	  	game.word = 'apple'
  	  	expect(display_output).to receive(:puts).with('_ _ _ _ _')
  	  	game.display_board
  	  end
  	end

  	describe '#correct_guess?' do
  	  it 'evaluates a player guess and returns true / false' do
  	  	game.word = 'apple'
  	  	expect(game.correct_guess?('l')).to be true
  	  end
  	end

  	describe '#player_guess' do
  	  context 'first correct guess' do
  	  	it 'displays the letter on the board' do
  	  	  game.word = 'apple'
  	  	  expect(display_output).to receive(:puts).with('_ _ _ l _')
  	  	  game.player_guess('l')
  	  	end
  	  	it 'treats all letters as capital letters' do
  	  	  game.word = 'apple'
  	  	  expect(display_output).to receive(:puts).with('_ _ _ l _')
  	  	  game.player_guess('l')
  	  	end
  	  	it 'displays all instances of a correctly guessed letter' do
  	  	  game.word = 'apple'
  	  	  expect(display_output).to receive(:puts).with('_ p p _ _')
  	  	  game.player_guess('p')
  	  	end
  	  	it 'displays a message that guess was correct' do
  	  	  game.word = 'apple'
  	  	  expect(display_output).to receive(:puts).with('Correct!')
  	  	  game.player_guess('p')
  	  	end  	  		
  	  end
  	  context 'correct guess, more than one letter correct' do
  	  	it 'displays all correct letters' do
  	  	  game.word = 'apple'
  	  	  game.guess_array = ['a']
  	  	  expect(display_output).to receive(:puts).with('a _ _ l _')
  	  	  game.player_guess('l')
  	  	end
  	  end
  	  context 'letter incorrect' do
  	  	it 'increases the number of incorrect guesses by 1' do
  	  	  game.word = 'apple'
  	  	  game.player_guess('x')
  	  	  expect(game.allowed_guesses).to eql 8
  	  	end
  	  	it 'outputs a message that the guess was incorrect' do
  	  	  game.word = 'apple'
  	  	  expect(display_output).to receive(:puts).with('Incorrect guess!')
  	  	  game.player_guess('x')
  	  	end
  	  end
  	end
  	describe '#gameover' do
  	  it 'displays a losing message' do
  	  	game.gameover
  	  	expect(display_output).to receive(:puts).with('Gameover! You failed to stop the hanging!')
  	  end
  	  it 'exits the program' do
  	  	expect(game.gameover).raise_exception(SystemExit)
  	  end
  	end
  	describe '#player_win?' do
  	  it 'returns true if all the letters of the word have been guessed' do
  	  	game.word = 'apple'
  	  	game.guess_array = ['a','e','p','l']
  	  	expect(game.player_win?).to be true
  	  end
  	end
  	describe '#victory' do
  	  it 'displays a victory message' do
  	  	game.victory
  	  	expect(display_output).to receive(:puts).with('You win!')
  	  end
  	  it 'exits the program' do
  	  	expect(game.victory).raise_exception(SystemExit)
  	  end
  	end

  end
end
