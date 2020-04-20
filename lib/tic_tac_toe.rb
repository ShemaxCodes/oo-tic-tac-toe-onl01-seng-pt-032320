require 'pry'

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  
def input_to_index(input)
  player = input.to_i - 1 
  
end 

def move(index, token = "X")
  @board[index] = token 
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end 

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
def turn_count 
  count = 0 
  @board.each do |position| 
    if position == "X" || position == "O"
      count += 1 
    end 
  end 
  return count 
end 

def current_player
  if turn_count.even?
    player = "X"
  else 
    player = "O"
  end
  
end 

def turn 
  puts "Please choose a number 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    player = current_player
    move(index, player)
    display_board
  else 
    turn 
  end 
end 

def won?
  WIN_COMBINATIONS.each do |combo|
    index_1 = @board[combo[0]]
    index_2 = @board[combo[1]]
    index_3 = @board[combo[2]]
    
    if index_1 == "X" && index_2 == "X" && index_3 == "X"
      return combo 
    elsif index_1 == "O" && index_2 == "O" && index_3 == "O"
      return combo 
  end
end 
   return false 
  end 
  
def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
 
def draw?
  
  !won? && full?
  
end 
  
def over?
  
  won? || full?

end 

def winner
  if not won?
    nil 
  elsif won? && turn_count.even?
  "O"
elsif won? && turn_count.odd?
  "X"
end 
end 

def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

