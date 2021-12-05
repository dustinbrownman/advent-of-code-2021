class BingoBoard
  attr_reader :board
  def initialize
    @board = []
  end

  def <<(row)
    @board << row
  end

  def mark(number)
    @board.each do |row|
      row.each_with_index do |cell, index|
        if cell == number
          row[index] = "X"
        end
      end
    end
  end

  def bingo?
    bingo_by_row? || bingo_by_column?
  end

  def to_s
    @board.map do |row|
      row.map { |cell| cell.to_s.rjust(2) }.join(" ")
    end.join("\n")
  end

  private

  def bingo_by_row?
    @board.any? { |row| row.all? { |cell| cell == "X" } }
  end

  def bingo_by_column?
    @board.transpose.any? { |row| row.all? { |cell| cell == "X" } }
  end
end
