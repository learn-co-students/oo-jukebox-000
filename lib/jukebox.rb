require 'pry'

class Jukebox

	def initialize(songs)
		@songs = songs
	end

	def call
	end

	def help
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
				if index == song[0].to_i
					binding.pry
					"/Now Playing: #{song2}/"
				end
			end
		end
	end

end

pop = Jukebox.new(["mom","dad"])
pop.play
pop.play("daddo")