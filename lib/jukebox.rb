require 'pry'

class Jukebox
    attr_accessor :songs, :input

    def initialize(songs)
        @songs = songs
    end

    def call
        puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
        while input != "exit"
            do_command
        end
    end

    def help
        puts "Select 'help', 'list', 'play', 'exit'"
    end

    def get_input
        puts "Enter a command:"
        @input = gets.chomp
    end

    def do_command
        get_input
        if input == "help"
            help
        elsif input == "list"
            list
        elsif input == "play"
            play
        elsif input == "exit"
        
        end
    end

    def list
        @songs.each_with_index do |song, index|
            puts "#{song}"
        end
    end

    def play
        puts "Enter a song number or enter the artist and song title, as shown in the list above"
        response = gets.chomp
        if songs.include?(response)
            puts "Now playing #{response}"
        elsif songs[response.to_i]
            puts "Now playing: #{songs[response.to_i-1]}"
        else
            puts "sorry, please enter a valid song or type 'help' for more options."
        end
    end
end
