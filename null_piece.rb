require_relative 'piece.rb'

class NullPiece < Piece

  def initialize#(board, pos)
    # super(nil, board, pos)
    nil
  end

  def moves
  end

  def symbol
    " "
  end

end
