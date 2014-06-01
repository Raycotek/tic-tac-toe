class Board

	attr_reader :board
	require_relative 'graphics.rb'
	include Graphics

	def initialize
		@board = Hash.new ( " ".to_sym )
	end

	def update(square, symbol)
		@board[square] = symbol
	end

	def draw
		self.display(@board)
	end

end