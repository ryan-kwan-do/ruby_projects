require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
  	puts "Initializing MicroBlogger"
  	@client = JumpstartAuth.twitter
  end

  def tweet(message)
  	if message.length < 141
  	  @client.update(message)
 	else 
 	  puts "Message over 140 chars (#{message.length}). Use a shorter message!"
 	end
  end

  def run
  	puts "Welcome to the JSL Twitter Client!"
  	command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
          else
          puts "Sorry, I don't know how to #{command}"
      end
	end
  end

end

blogger = MicroBlogger.new
blogger.run