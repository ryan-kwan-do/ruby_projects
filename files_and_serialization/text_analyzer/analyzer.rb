# Following along with Beginning Ruby - Chapter 4
lines = File.readlines(ARGV[0])
stop_words = %w{the a by on for of are with just but and to the my has some in}
text = lines.join

line_count = lines.size

#counting characters
total_chars = text.length
total_chars_no_spaces = text.gsub(/\s+/, '').length

#counting words, sentences and paragraphs
total_words_with_scan = text.scan(/\w+/).size
total_words_with_split = text.split.length
sentence_count = text.scan(/\.|\?|!/).size
paragraph_count = text.scan(/\n\n/).size

#Make a list of words that aren't stop words, count them, 
# and work out the percentage of non-stop words to all words

all_words = text.scan(/\w+/)
key_words = all_words.select { |word| !stop_words.include?(word)}
key_word_count = key_words.size
good_percentage = ((key_words.length.to_f / all_words.length.to_f) * 100).to_i

#cherry picking interesting sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{total_chars} total characters"
puts "#{total_chars_no_spaces} total characters without spaces"
puts "#{total_words_with_scan} words with scan"
puts "#{total_words_with_split} words with split"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count/paragraph_count} avg sentences per paragraph"
puts "#{total_words_with_split/sentence_count} avg words per sentence"
puts "#{key_word_count} key words"
puts "#{good_percentage}% of cool words to not"
puts "Summary: \n\n" + ideal_sentences.join(". ")