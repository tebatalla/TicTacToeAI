require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end
    if self.next_mover_mark == evaluator
      self.children.any? do |child_node|
        child_node.winning_node?(evaluator)
      end
    else
      self.children.all? { |child_node| child_node.winning_node?(evaluator) }
    end
  end

  def children
    child_boards = []
    (0...@board.rows.length).each do |x|
      (0...@board.rows.length).each do |y|
        if @board[[x, y]].nil?
          next_board = @board.dup
          next_board[[x,y]] = @next_mover_mark
          next_board_mover_mark = ((@next_mover_mark == :x) ? :o : :x)
          next_board_node = TicTacToeNode.new(next_board, next_board_mover_mark, [x, y])
          child_boards << next_board_node
        end
      end
    end
    child_boards
  end


  def losing_node?(evaluator)
    if @board.over?
      if @board.winner.nil?
        return false
      elsif @board.winner != evaluator 
        return true
      else
        return false
      end
    end

    if self.next_mover_mark == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end
end
