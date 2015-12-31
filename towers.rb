# player starts the game (script), provides the initial height of the tower
# instructions are printed
# game board is printed with height specified by user
# user is prompted to enter a move 
# check for valid user input

# move a disk according to user input
# `render` method prints the current game board
# check if user has won, otherwise prompt user for another input
# continue to check for valid user input, move the disk, render the board, check if user has won, prompt for another input

# game quits when user enters `quit` or wins



class TowerofHanoi

  def initialize(height)
    @height = height
  end


  def print_instructions
    puts "Welcome to Tower of Hanoi!",
    "Instructions:",
    "Enter where you'd like to move a disk from and to",
    "in the format [1,3]. Enter 'q' to quit."
  end


  def make_gameboard(height)
    gameboard = []
    # initialize array of arrays with n rows filled with 0
    (height).times { gameboard << Array.new(height, 0) }
    # bottom row is 1..height, doesn't change
    gameboard << (1..height).to_a
    # add the rings to column 1 (which is really index 0)
    ring_size = 1
    ring_row = 0
      while ring_size < height+1
        gameboard[ring_row][0] = ring_size
        ring_size += 1
        ring_row += 1
      end

    print gameboard

  end


  def user_input
    # TODO: make this validation correct, maybe use regex?
    input_array = nil
    until input_array.is_a?(Array) # && input.length == 2
      puts "Enter move >"
      input = gets.chomp
      # `gets` returns a string, need to chop it into an array
      input_array = input[1..-2].split(',').collect! {|n| n.to_i}
    end
    return input_array
  end

  def validate_move
    # make sure the move is physically possible
    # condition 1: ring has no rings on top of it
    # condition 2: ring is moving to a column that is not full
  end

  def move_disk(input_array)



  end


  def play
    print_instructions
    make_gameboard(height)




  end




end


t = TowerofHanoi.new(3)
t.play