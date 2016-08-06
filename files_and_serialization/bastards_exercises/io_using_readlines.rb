require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts open(url).readline
local_file = "hamlet.txt"
#1. Saves hamlet from the url to a local file called hamlet.txt


File.open(local_file, "w") {|file| file.write(open(url).read)}
#2. Re-opens to print every 42nd line of Hamlet
File.open(local_file,"r") do |file|
  file.readlines.each_with_index do |line, index|
  	puts line if index % 42 == 41
  end
end
