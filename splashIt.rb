# Created with com1001---ruby-assignment.
# User: bwilliams0
# Date: 2016-11-28
# Time: 04:17 PM
# To change this template use Tools | Templates.
require 'console_splash'

class SplashIt
 
  splash = ConsoleSplash.new(35,88)
  splash.write_header("Splash It", "Ben Williams", "0.1.0")
  splash.write_horizontal_pattern("v^")
  splash.write_vertical_pattern("|")
  splash.splash
  gets
  `clear`
  
  highScore = 0
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
end
