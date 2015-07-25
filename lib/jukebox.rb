require 'pry'

class Jukebox

	def initialize(songs)
		@songs = songs
	end

	def call
		puts "Welcome! Input your command now:"
		input = gets.chomp
		until input == "exit"
			case input
			when /help/
				help
				input = gets.chomp.downcase
			when /list/
				list
				input = gets.chomp.downcase
			when /play/
				input_array = input.split
				if input_array.length == 1
				  play
				else
					input_array.shift
					input = input_array.join(" ")
					play(input)
				end
				input = gets.chomp.downcase
			else
				puts "That command is not recognized. Type 'help' to review your options."
				input = gets.chomp.downcase
			end
		end
		puts "Goodbye!"
	end

	def help
		puts "Here are your possible commands:"
		puts "help"
		puts "list"
		puts "play"
		puts "exit"
	end

	def list
		@songs.each do |song|
			puts song
		end
	end

	def play(*song)
		if song == []
			puts "/Now Playing: #{@songs[0]}/"
		elsif song[0].length > 2
		  puts "/Now Playing: #{song[0]}/"
		else
			@songs.each_with_index do |song2, index|
				if index + 1 == song[0].to_i
					puts "/Now Playing: #{song2}/"
				end
			end
		end
	end

end