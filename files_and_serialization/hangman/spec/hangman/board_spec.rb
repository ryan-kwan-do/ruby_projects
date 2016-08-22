require 'spec_helper'

module Hangman
  describe Board do
  	describe '#reveal_correct_guesses' do
  	  context 'empty guess array' do
  	  	it 'creates array with only blanks' do
  	  	  board = Board.new('apple', [])
  	  	  expect(board.reveal_correct_guesses).to eql(['_','_','_','_','_'])
  	  	end
  	  end
  	  context 'one correct letter, appearing once in word' do
  	  	it 'reveals that letter and leaves the rest as blanks' do
  	  	  board = Board.new('apple', ['a'])
  	  	  expect(board.reveal_correct_guesses).to eql(['a', '_', '_','_','_'])
  	  	end 
  	  end
  	  context 'one correct letter, appearing multiple times' do
  	    it 'reveals every instance of the letter' do
  	      board = Board.new('apple', ['p'])
  	      expect(board.reveal_correct_guesses).to eql(['_', 'p', 'p', '_', '_'])
  	    end
  	  end
  	  context 'multiple correct letters' do
  	  	it 'reveals every correct letter and leaves the rest' do
  	  	  board = Board.new('apple', ['a','p'])
  	      expect(board.reveal_correct_guesses).to eql(['a', 'p', 'p', '_', '_'])
  	    end
  	  end

  	describe '#show_the_man' #shows the ASCII art

  	end
  end
end