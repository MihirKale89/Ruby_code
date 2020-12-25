class TicTacToe
  def tictactoe(moves)
    a_moves = []
    b_moves = []
    a_move = true
    moves.each { |m|
      a_move ? a_moves << m : b_moves << m
      return 'A' if a_moves.size > 2 && check_winner(a_moves)
      return 'B' if b_moves.size > 2 && check_winner(b_moves)
      a_move = !a_move
    }
    a_moves.size + b_moves.size == 9 ? 'Draw' : 'Pending'
  end

  def check_winner(moves)
    winning_moves = [
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [0, 2]]
    ]
    winning_moves.each do |arr|
      return true if arr - (arr & moves) == []
    end
    false
  end
end

t = TicTacToe.new
p t.tictactoe([[0, 0], [1, 1], [0, 1], [0, 2], [1, 0], [2, 0]])
