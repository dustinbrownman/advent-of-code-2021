require_relative "./bingo_board"

def test_marking_board
  board = BingoBoard.new
  board << [1, 2, 3, 4, 5]

  board.mark(3)

  board.board[0][2] == "X"
end

def test_marking_board_with_multiple_rows
  board = BingoBoard.new
  board << [1, 2, 3, 4, 5]
  board << [6, 7, 8, 9, 10]

  board.mark(9)

  board.board[1][3] == "X"
end

def test_bingo_by_complete_row
  board = BingoBoard.new
  board << [ 1,  2,  3,  4,  5]
  board << [ 6,  7,  8,  9, 10]
  board << [11, 12, 13, 14, 15]
  board << [16, 17, 18, 19, 20]
  board << [21, 22, 23, 24, 25]

  board.mark(11)
  board.mark(12)
  board.mark(13)
  board.mark(14)
  board.mark(15)

  board.bingo?
end

def test_bingo_by_complete_column
  board = BingoBoard.new
  board << [ 1,  2,  3,  4,  5]
  board << [ 6,  7,  8,  9, 10]
  board << [11, 12, 13, 14, 15]
  board << [16, 17, 18, 19, 20]
  board << [21, 22, 23, 24, 25]

  board.mark(3)
  board.mark(8)
  board.mark(13)
  board.mark(18)
  board.mark(23)

  board.bingo?
end

test_methods = [
  :test_marking_board,
  :test_marking_board_with_multiple_rows,
  :test_bingo_by_complete_row,
  :test_bingo_by_complete_column,
]

test_methods.each do |method|
  puts "Running #{method}..."
  puts send(method) ? "PASS" : "FAIL"
end
