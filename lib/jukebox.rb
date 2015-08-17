require 'pry'

class Jukebox

  def initialize(song_list)
    @songs = song_list
  end

  def call
    input = gets.chomp
    if input == 'help'
      help
    elsif input == 'list'
      list
    elsif input == 'play'
      play
    elsif input.start_with?('play')
      play(input.slice(5..input.length))
    end      
  end

  def help
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def list
    @songs.each {|song|puts song}
  end

  def play(*song_name_or_number)
    @songs.each.with_index do |song,index|
      if song_name_or_number == []
        puts "Enter song_name_or_number"
        song_name_or_number[0] = gets.chomp
      end
      if song == song_name_or_number[0]
        puts "Now Playing: #{song}"
      elsif index == (song_name_or_number[0].to_i - 1)
        puts "Now Playing: #{song}"
      end
    end
  end

end