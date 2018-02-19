require_relative 'piece.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    # @sentinel = NullPiece.new
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    begin
      @rows[start_pos].nil? ? NoPieceError : @rows[start_pos] = NullPiece
      valid_pos?(end_pos) ? InvalidPosError : @rows[end_pos] = @piece
    rescue NoPieceError => e #|| InvalidPosError => e
      puts e.message
    retry
      move_piece(start_pos, end_pos)
    end
  end

  def valid_pos?(pos)

  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)
  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)

  end
end

class NoPieceError < StandardError
  def message
    "No piece to move."
  end

end

class InvalidPosError < StandardError
  def message
    "Invalid Position"
  end
end
