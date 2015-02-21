require_relative 'tic_tac_toe_node'


class SuperComputerPlayer < ComputerPlayer

  def move(game, mark)
    tree = TicTacToeNode.new(game.board, mark)
    tree.children.each do |node|
      return node.prev_move_pos if node.winning_node?(mark)
    end
    tree.children.each do |node|
      return node.prev_move_pos unless node.losing_node?(mark)
    end
    raise "what the hell, you cheated!"
  end


end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
