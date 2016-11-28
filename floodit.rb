require 'console_splash'
collumns = 14
rows = 9

def get_board(width, height)
  # TODO: Implement this method
  #
  # This method should return a two-dimensional array.
  # Each element of the array should be one of the
  # following values (These are "symbols", you can use
  # them like constant values):
  # :red
  # :blue
  # :green
  # :yellow
  # :cyan
  # :magenta
  #
  # It is important that this method is used because
  # this will be used for checking the functionality
  # of your implementation.
end

# TODO: Implement everything else as described in the
#       assignment brief.
def splashScreen(height,width)
  splash = ConsoleSplash.new(height,width)
  splash.write_header("Splash It", "Ben Williams", "0.1.0")
  splash.write_horizontal_pattern("v^")
  splash.write_vertical_pattern("|")
  splash.splash
  gets
  `clear`
end

def mainMenu(q)
  quit = q
  highScore = 0
  begin
  puts "Main menu: "
  puts "S = Start"
  puts "C = Change size"
  puts "Q = Quit"
  if highScore == 0 then
    puts "No games played yet"
    else
    puts "Highscore: #{highScore}"
  end
    print "Please enter your choice: "
    input = gets.chomp.upcase
    if input == 'S' then 
      mainGame()
      elsif input == 'C'
      changeSize()
      elsif input == 'Q' then 
          quit = true 
      end
      return quit
      print quit 
    end until quit == true
 end
     
def changeSize(collumns, rows)
 
end
      splashScreen(20,30)
     mainMenu(false)