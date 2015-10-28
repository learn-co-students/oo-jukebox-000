require 'pry'

class Jukebox

  attr_reader :songs
  attr_accessor :input

  def initialize(songs)
    @songs = songs
  end

  def call
    "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    do_command
  end

  def do_command
    puts "Enter a command:"
    get_input
    case @input.downcase
    when "help"
      help
    when "list"
      list
    when "play"
      play
    when "exit"
    end
  end

  def get_input
    @input = gets.chomp
    if @input.to_i > 0
      @input = @input.to_i - 1
    end
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    get_input
    if input.is_a? Integer
      puts "Now playing: #{@songs[@input]}"
    else
      puts "Now playing #{@input}"
    end
  end

  def help
    puts "help\nlist\nplay\nexit" 
  end

  def list
    @songs.each.with_index(1){|song,index| 
      puts "#{index} #{song}"
    }
  end

end
