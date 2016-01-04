# player starts the game (script), provides the initial height of the tower
# instructions are printed
# game board is printed with height specified by user
# user is prompted to enter a move 
# check for valid user input
# move a disk according to user input
# `render` method prints the current game board
# check if user has won, otherwise prompt user for another input
# continue to check for valid user input, move the disk, render the board, check if user has won, prompt for another input
# game exits when user enters `quit` or wins

require 'pry'


class TowerofHanoi


  attr_reader :height


  def initialize(height)
    @height = height
  end


  def print_instructions
    puts "Welcome to Tower of Hanoi!",
    "Instructions:",
    "Enter where you'd like to move a disk from and to",
    "in the format [1,3]. Enter 'q' to quit."
  end


  def make_gameboard(height=3)
    towera = (1..height).to_a.reverse
    towerb = []
    towerc = []
    gameboard = [towera, towerb, towerc]
    print gameboard
    return gameboard
  end



  def user_input
    # TODO: make this validation correct, maybe use regex?
    input_array = nil
    puts "\nEnter move >"
    input = gets.chomp
    if input == "q"
      puts "Okay, bye!"
      exit
    # `gets` returns a string, need to chop it into an array
    else
      input_array = input[1..3].split(',').collect! {|n| n.to_i}
      return input_array
    end
  end


  def validate_move
    # make sure the move is physically possible
    # condition 1: ring has no rings on top of it
    # condition 2: ring is moving to a column that is not full
  end


  def move_disk(gameboard, input_array)
    from_column = (input_array[0]-1)
    to_column = (input_array[1]-1)
    disk = gameboard[from_column].pop
    gameboard[to_column].push(disk)
    print gameboard
    return gameboard
  end


  def user_has_won?(gameboard)
    winning_tower = (1..@height).to_a.reverse
    gameboard.each do |tower|
      if tower == winning_tower
        true
      else
        false
      end
    end
  end



  def play
    print_instructions
    gameboard = make_gameboard(@height)

    loop do
      input_array = user_input
      validate_move
      new_gameboard = move_disk(gameboard, input_array)
      if user_has_won?(new_gameboard)
        print "\nCongratulations, you win!"
        return
      end

    end

  end



end # end of class





t = TowerofHanoi.new(1)
t.play