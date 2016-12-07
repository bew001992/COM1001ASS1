require 'console_splash'
require 'colorize'
require 'colorized_string'


$highScore = 0


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
  $turns = 0
  $win = false
  board = Array.new(height){Array.new(width)}
  #initializes game board with random colour in each cell
  (0...height).each do |x|
    (0...width).each do |y|
    z = rand(11)
      case z
        when 0,1
        board[x][y] = :red
        when 2,3
        board[x][y] = :blue
        when 4,5
        board[x][y] = :green
        when 6,7
        board[x][y] =  :yellow
        when 8,9
        board[x][y] = :cyan
        when 10,11
        board[x][y] = :magenta
      end
    end
  end
  $prevCol = board[0][0]
  #prints out gameboard 
  printBoard(board,width,height)
  begin
  input = gets.chomp
  updater(input,board,width,height)
  end until $win == true
    cScore = $turns
  if $highScore == 0 then
    $highScore = cScore
  elsif $highScore != 0 then
      if cScore < $highScore && 
      $highScore = cScore
      end
    end
    puts "Congratulations, you won in #{$turns} turns"
    gets
    mainMenu(false,width,height)
end

# TODO: Implement everything else as described in the
#       assignment brief.
def splashScreen(height,width)
  splash = ConsoleSplash.new(height,width)
  splash.write_header("Flood It", "Ben Williams", "0.7.0")
  splash.write_horizontal_pattern("v^")
  splash.write_vertical_pattern("|")
  splash.splash
  gets
  `clear`
end

def mainMenu(q,gWidth,gHeight)
  quit = q
  
  begin
  puts "Main menu: "
  puts "S = Start"
  puts "C = Change size"
  puts "Q = Quit"
  if $highScore == 0 then
    puts "No games played yet"
    else
    puts "Highscore: #{$highScore}"
  end
    print "Please enter your choice: "
    input = gets.chomp.upcase
    if input == 'S' then 
      get_board(gWidth,gHeight)
      elsif input == 'C'
      changeSize(gWidth,gHeight)
      elsif input == 'Q' then 
          quit = true 
      end
      return quit
      print quit 
    end until quit == true
 end
      
def printBoard(board,width,height)
  (0...height).each do |x|
    (0...width).each do |y|
      z = board[x][y]
      case z
        when :red
        print ColorizedString["  "].colorize( :background => :red)
        when :blue
        print ColorizedString["  "].colorize( :background => :blue)
        when :green
        print ColorizedString["  "].colorize( :background => :green)
        when :yellow
        print ColorizedString["  "].colorize( :background => :yellow)
        when :cyan
        print ColorizedString["  "].colorize( :background => :cyan)
        when :magenta
        print ColorizedString["  "].colorize( :background => :magenta)
      end
    end
    puts
   
  end
   puts "Number of turns: #{$turns}"
  puts "Current completion: #{check(board,width,height)} %"
  print "Choose a colour: "
end
     
def check(board,width,height)
  currentCol = board[0][0]
  noSquares = width * height 
  winCol = 0
  (0...height).each do |x|
    (0...width).each do |y|
        if board[x][y] == currentCol then
          winCol = winCol + 1
      end
    end
     end
     compPercent = (winCol.to_f / noSquares.to_f) * 100
    if compPercent == 100 then
      $win = true
    end
      return compPercent.ceil
end
 
  def updater(input,board,width,height)
  
    puts $prevCol
    case input
     when 'r'
     newCol = :red
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          break
        end
       end
      end
         $prevCol = newCol
       when 'b'
     newCol = :blue
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          $prevCol = newCol
          break
        end
       end
      end
        when 'g'
     newCol = :green
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          
          break
        end
       end
       end
        $prevCol = newCol
      when 'y'
     newCol = :yellow
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          $prevCol = newCol
          break
        end
       end
      end
        when 'c'
     newCol = :cyan
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          break
        end
       end
      end
         $prevCol = newCol
        when 'm'
     newCol = :magenta
      (0...height).each do |x|
       (0...width).each do |y|
        if board[x][y] == $prevCol then
          board[x][y] = newCol
        elsif board[x][y] == newCol
          break
        end
       end
      end
                $prevCol = newCol
        when 'q'
        mainMenu(false,width,height)
     end
    $turns = $turns + 1
      printBoard(board,width,height)
  end
      
def changeSize(width, height)
 print "Width '(Currently #{width})?"
  width = gets.chomp.to_i
  print "Height '(Currently #{height})?"
  height= gets.chomp.to_i
  mainMenu(false,width,height)
end
      splashScreen(20,30)
     mainMenu(false,14,9)