require "csv"
require "sunlight/congress"
require "erb"
require "date"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(number)
  string_number = number.to_s
  if string_number.length == 10 
  	string_number[0..9]
  elsif string_number.length == 11 && string_number[0] == "1"
  	string_number[1..10]
  else "Invalid mobile number"
  end
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def convert_date(contents)

  date_array = Array.new

  contents.each do |row|
  	reg_date_format = '%m/%d/%y %H:%M'
    reg_date = DateTime.strptime(row[:regdate], reg_date_format)
    date_array << reg_date
  end

  date_array

end

def peak_hours(contents)

  count_hour = Hash.new
  date_array = convert_date(contents)

  date_array.each do |date|
  	count_hour[date.hour].nil? ? count_hour[date.hour] = 1 : count_hour[date.hour] += 1
  end

  count_hour.sort.each {|key, value| puts "Hour: #{key}, Count: #{value}"}

end

def peak_day(contents)
  count_day = Hash.new
  date_array = convert_date(contents)

  date_array.each do |date|
  	count_day[date.strftime('%A')].nil? ? count_day[date.strftime('%A')] = 1 : count_day[date.strftime('%A')] += 1
  end

  count_day.sort.each {|key, value| puts "Day: #{key}, Count: #{value}"}

end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
=begin
	
#begin control flow
puts "Event manager initialized!"
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)
end
=end

