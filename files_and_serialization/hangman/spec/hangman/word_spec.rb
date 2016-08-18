require 'spec_helper'

module Hangman
  describe Word do
  	let(:word) { Word.new }

  	context '#load_words' do
  	  it 'loads an array of words from file with words with at least 5 chars' do
  	  	word_array = word.load_words
  	  	expect(word_array.group_by(&:size).min.last.max.size).to eql 5
  	  end
  	  it 'loads an array of words from file with words with no more than 12 chars' do
  	  	word_array = word.load_words
  	  	expect(word_array.group_by(&:size).max.last.max.size).to eql 12
  	  end
    end

    context '#new_word' do
      it 'selects a random word' do
      	rand_word = word.new_word
        expect(rand_word).to be_instance_of(String)
      end
    end 

  end
end