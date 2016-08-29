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

  def dm(target, message)
  	puts "Trying to send #{target} this direct message:"
    puts message
    if followers_list.include?(target)
      message = "d @#{target} #{message}"
      tweet(message)
    else
      puts "Sending message failed. #{target.capitalize} not one of your followers."
    end
  end

  def followers_list
    @client.followers.collect { |follower| @client.user(follower).screen_name }
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
        when 'dm' then dm(parts[1], parts[2..-1].join(" "))
        when 'l' then followers_list.each {|follower| puts follower}

          else
          puts "Sorry, I don't know how to #{command}"
      end
	end
  end

end

blogger = MicroBlogger.new
blogger.run