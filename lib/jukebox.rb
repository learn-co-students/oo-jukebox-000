class Jukebox
	attr_accessor :songs, :input, :call, :list_ouput, :play

	

	def initialize(songs)
		@songs = songs
		@input
		@list_ouput = []
		@commands = ["help", "list", "play", "exit"]
	end

	def help
		@commands.each do |x|
			puts "#{x}"
		end
	end

	def get_input
		#puts "Enter a command"
		@input = gets.chomp
	end

	def do_command
		command = self.get_input
		if command == "help"
			self.help
		elsif command == "exit"
			self.exit
		elsif command == "list"
			self.list
		elsif command == "play"
			self.play
		end
	end

	def play
		puts "Enter a song number or enter the artist and song title, as shown in the list above"
		i = gets.chomp
		p = i.split('')
		if p.length > 1
			@songs.each do |x|
				if x.include?(i)
					puts "Now playing #{x}"
				end
			end
		elsif i.to_i < @songs.length-1
			i = i.to_i
			puts "Now playing: #{@songs[i-1]}"
		else
			puts "sorry, please enter a valid song or type 'help' for more options."
		end
	end

	def list
		@songs.each_with_index do |i,x|
			puts "#{i} #{x}"
		end
	end






end
