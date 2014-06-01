class Board

	attr_reader :board
	require './graphics.rb'
	include Graphics

	def initialize
		@board = Hash.new ( " " )
	end

	def update(square, symbol)
		@board[square] = symbol
	end

	def draw
		self.display(@board)
	end

end