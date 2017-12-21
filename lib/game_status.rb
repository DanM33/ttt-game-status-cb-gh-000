# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  count = 0
  x_count = 0
  o_count = 0
  x_array = [-1,-1,-1]
  o_array = [-1,-1,-1]
  board.each do |position|
    if position == "X"
      x_array[x_count]=count
      x_count+=1
    elsif position == "O"
      o_array[o_count]=count
      o_count+=1
    end
    count+=1
  end
  won = WIN_COMBINATIONS.detect do |combination|
    combination == x_array || combination == o_array
  end
  return won
end

def full?(board)
  return board.all? do |position|
    position_taken?(board,position)
  end
end
