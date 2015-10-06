require 'pry'

class Jukebox

  attr_accessor :songs, :input

  def initialize(songs)
    @songs = songs
    
  end

  def call
    puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    self.get_input
  end

  def help
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def get_input
    puts "Enter a command:"
    @input = gets.chomp
    self.do_command
  end

  def do_command
    case @input.downcase
    when "help"
      self.help
    when "list"
      self.list
    when "play"
      self.play
    when "exit"
      self.exit
    end
  end

  def list
    @songs.each_with_index do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    user_input = gets.chomp

    if user_input.length == 1
      if user_input.to_i > 0 && user_input.to_i < (@songs.count + 1)
        puts "Now playing: #{@songs[(user_input.to_i - 1)]}"
      else
        puts "sorry, please enter a valid song or type 'help' for more options"
      end
    else
      #user entered a song name
      downcased_array = @songs.map(&:downcase)
        if downcased_array.include?(user_input.downcase)
            puts "Now playing #{user_input}"
        else
            puts "sorry, please enter a valid song or type 'help' for more options."
        end

    end
  end

end
