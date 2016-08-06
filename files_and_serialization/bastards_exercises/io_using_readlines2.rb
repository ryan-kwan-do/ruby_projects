local_file = "hamlet.txt"

is_hamlet_speaking = false
hamlet = File.open(local_file,"r") do |file|
  file.readlines.each do |line|

  	if is_hamlet_speaking == true && (line.match(/^  [A-Z]/) || line.strip.empty?)
  	  is_hamlet_speaking = false
  	end

    is_hamlet_speaking = true if line.match("Ham\.")

    puts line if is_hamlet_speaking == true
  end
end

