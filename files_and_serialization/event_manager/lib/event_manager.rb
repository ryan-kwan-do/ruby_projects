require "csv"
puts "Event manager initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode].to_s
  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
  if !zipcode
  	zipcode = "00000"
  elsif	zipcode.size < 5
  	zipcode = 0.to_s + zipcode until zipcode.size == 5
  else 
  	zipcode[0] = '' until zipcode.size == 5
  end

  puts zipcode
end