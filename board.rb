class Board

	attr_reader :board, :empty_square
	require_relative 'graphics.rb'
	include Graphics

	def initialize
		@empty_square = " ".to_sym
		@board = Hash.new ( @empty_square )
	end

	def update(square, symbol)
		@board[square] = symbol
	end

	def draw
		self.display(@board)
	end

end