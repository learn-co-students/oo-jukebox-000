require "pry"

class Jukebox

  attr_accessor :songs

  def initialize(songs)
    @songs = songs
  end

  def call
    loop do
      print "Please enter a command:\n"
      input = gets.chomp
        if input.upcase == "EXIT"
          break
        elsif input.upcase == "HELP"
          help
        elsif input.upcase == "LIST"
          list
        elsif input.upcase.include?("PLAY") && input.length == 4
          newInput = gets.chomp
          if newInput.upcase == "EXIT"
            break
          else
            play(newInput)
            break
          end
        elsif input.upcase.include?("PLAY")
          newInput = input.delete("play")
          play(newInput)
          break
        else 
          print "Invalid input, please try again"
        end
      end
  end

  def help
    print "?=.*help)(?=.*list)(?=.*play)(?=.*exit).+"
  end

  def list
    songs.each_with_index { |song| puts "#{song}\n" }
  end

  def play(song = nil)
    if song == nil
    newInput = gets.chomp
      if newInput.to_i > 0 && newInput.to_i < 10
        puts "Now Playing: #{songs[newInput.to_i - 1]}"
      elsif newInput.to_i > 10
        print "Invalid input, please try again"
      else newInput.class == String
        puts "Now Playing: #{song}"
      end
    else
      if song.to_i > 0 && song.to_i < 10
        puts "Now Playing: #{songs[song.to_i - 1]}"
      elsif song.to_i > 10
        print "Invalid input, please try again"
      else 
        print "Now Playing: #{song}\n"    
      end
    end
  end

end