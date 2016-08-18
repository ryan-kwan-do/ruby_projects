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
  	  it 'displays a blank board'
  	  it 'displays the remaining number of incorrect guesses'
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
