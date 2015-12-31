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

require 'pry'


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
    (height).times { gameboard << Array.new(3, 0) }
    # bottom row is 1..3, doesn't change
    gameboard << (1..3).to_a
    # add the rings to column 1 (which is really index 0)
    ring_size = 1
    ring_column = 0
      while ring_size <= height
        gameboard[ring_column][0] = ring_size
        ring_size += 1
        ring_column += 1
      end

    print gameboard
    return gameboard
  end


  def user_input
    # TODO: make this validation correct, maybe use regex?
    input_array = nil
    puts "\nEnter move >"
    input = gets.chomp
    # `gets` returns a string, need to chop it into an array
    input_array = input[1..-2].split(',').collect! {|n| n.to_i}
    return input_array
  end


  def validate_move
    # make sure the move is physically possible
    # condition 1: ring has no rings on top of it
    # condition 2: ring is moving to a column that is not full
  end


  def remove_disk(input_array, gameboard)
    from_column = input_array[0]-1 # [1] column, really 0
    # find top-most disk in from_column
    row = 0
    @height.times do
      if gameboard[row][from_column] == 0
        row +=1
      else
        disk_to_move = gameboard[row][from_column]
        # replace disk with 0
        gameboard[row][from_column] = 0
      end
      return disk_to_move
    end
  end


  def move_disk_to_new_column(input_array, gameboard, disk_to_move)
    to_column = input_array[1]-1  # [3] column, really 2
    # move disk to lowest 0 in to_column
    bottom_row = @height-1
    (@height-1).times do
      if gameboard[bottom_row][to_column] == 0
        gameboard[bottom_row][to_column] = disk_to_move
        break
      else
        bottom_row -= 1
      end
    end
    print gameboard
    return gameboard
  end


  def user_has_won(gameboard)
    solution = (1..@height).to_a
    row_index = 0
    column_index = 0
    (@height-1).times  # go through the rows
      if gameboard[row_index][column_index] < gameboard[row_index+1][column_index]
        row_index += 1
        return true
      else
        return false
      end
  end



  def play
    print_instructions
    gameboard = make_gameboard(@height)

    input_array = ""
    while input_array != "q"

      input_array = user_input
      print input_array
      validate_move
      disk_to_move = remove_disk(input_array, gameboard)
      move_disk_to_new_column(input_array, gameboard, disk_to_move)

    end

  end



end # end of class





# t = TowerofHanoi.new(3)
# t.play