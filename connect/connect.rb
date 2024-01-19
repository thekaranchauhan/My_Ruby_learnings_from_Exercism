class Board
  attr_reader :board, :rows, :cols

  def initialize(board)
    @board = board.map { |r| r.tr(" ", "") }
    @rows = @board.size
    @cols = @board.first.size
  end

  def winner
    %w[X O].find { |player| winner?(player) } || ""
  end

  def winner?(player)
    (0...board.size).any? { |row| valid_path?(player, [[row, 0]]) }
  end

  def valid_path?(player, path)
    row, col = path.last
    return false unless board[row][col] == player
    return true if player == "X" && col == cols - 1
    return true if player == "O" && row == rows - 1

    candidates = [[1, 0], [0, 1], [-1, 1], [-1, 0], [0, -1], [1, -1]].select do |i, j|
      (0...rows).cover?(row + i) &&
        (0...cols).cover?(col + j) &&
        board[row + i][col + j] == player &&
        !path.include?([row + i, col + j])
    end

    candidates.any? { |i, j| valid_path?(player, path + [[row + i, col + j]]) }
  end
end