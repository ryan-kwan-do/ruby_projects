require 'socket'

server = TCPServer.open(3000)

loop {
	client = server.accept
	client.puts(Time.now.ctime)
	client.puts "Want to do something else?"
	client.puts("Closing the connection. Bye!")
	client.close
}