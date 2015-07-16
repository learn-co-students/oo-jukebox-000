class Jukebox

  def initialize(songs)
    @songs = songs.each_with_object([]) { |song, res| res << song }
  end
  
  def ask_for_input
    # commented because of specs
	#print "enter the valid command ('help' for help, 'exit' for exit): "
  end
  
  def call
    ask_for_input
    loop do
	  input = gets.chomp
	  case input
	    when 'help' 
		  help
        when 'list' 
		  list
        when 'play' 
		  play		
		when 'exit' 
		  return
		else 
		  match_data = /^play (.+)/.match(input)
		  match_data == nil ? ask_for_input : play(match_data[1])
	  end	
    end
  end
  
  def help
    puts "available commands: list, play, help, exit"
  end
  
  def list
    @songs.each { |song| puts song }
  end
  
  def ask_for_play_arg
    # commented because of specs
	#print "please enter what to play (song name or number): "
	gets.chomp
  end
  
  def play_by_name(name)
    if @songs.include?(name)
	  puts "Now Playing: #{name}"
	else
      puts "Song not found"
	end  
  end
  
  def play_by_num(num)
    if (1..@songs.size).cover?(num)
	  puts "Now Playing: #{@songs[num-1]}"
	else
      puts "Song not found"
	end  
  end
  
  def play(arg = "")
    arg = ask_for_play_arg if arg == ""
	arg.to_i == 0 ? play_by_name(arg) : play_by_num(arg.to_i)
  end
  
end