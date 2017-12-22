class Jukebox
  attr_accessor :songs, :input

  def initialize(songs) #songs is passed in as an array
    @songs = songs
  end

  def help
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def get_input
    @input = gets.chomp
  end

  def do_command
      get_input
      if @input == "help"
        help
      elsif @input == "list"
        list
      elsif @input == "play"
        play
      elsif @input == "exit"
        puts "Goodbye"
      end
    return @input
  end

  def list
    @songs.each {|song| puts song}
  end

  def play #accepts a song and plays that song
      count = @songs.length
      puts  "Enter a song number or enter the artist and song title, as shown in the list above"
      song_choice = get_input
        if @songs.include?(song_choice)
          puts "Now playing #{song_choice}"
        elsif (1..count).include?(song_choice.to_i)
          i = song_choice.to_i
          i = i-1
          puts "Now playing: #{@songs[i]}"
        else
          puts "Invalid input, please try again"
        end
  end


  def call
    "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    input = get_input
    while input != "exit"
      do_command
    end 
  end

end
