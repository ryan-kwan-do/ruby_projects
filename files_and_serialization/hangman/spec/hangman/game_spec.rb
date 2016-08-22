require 'spec_helper'

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
  	  it 'displays a blank board' 
  	  it 'displays the remaining number of incorrect guesses' do
  	  	expect(display_output).to receive(:puts).with('You can make 9 more mistakes before the man hangs.')
  	  	game.start_new_game
  	  	expect(game.guesses).to eql 9	  	
  	  end	
  	end
  	describe '#display_board' do
  	  it 'outputs the current board' do
  	  	game.word = 'apple'
  	  	expect(display_output).to receive(:puts).with('_ _ _ _ _')
  	  	game.display_board
  	  end
  	end
  	describe '#player_guess' do
  	  context 'one letter correct'
  	  context 'more than one letter correct'
  	  context 'no letters correct'
  	end
  	describe '#player_lose'
  	describe '#player_win'

  end
end
