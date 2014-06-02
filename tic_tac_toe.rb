class Game
	require_relative 'board.rb'
	require_relative 'player.rb'
	require_relative 'mechanics.rb'
	include Mechanics

	def setup
		@xplayer = Player.new
		puts "Enter name for X player:"
		# @xplayer.name = gets.chomp.capitalize
		@xplayer.name = "Alan"
		@xplayer.symbol = :x 
		
		@oplayer = Player.new
		puts "Enter name for O player:"
		# @oplayer.name = gets.chomp.capitalize
		@oplayer.name = "Marj"
		@oplayer.symbol = :o

		@player_array = [@xplayer, @oplayer]
	end

	def initialize
		@game = Board.new
		@game.draw
		puts "Welcome to Tic-Tac-Toe!"
		self.setup
		self.turn(rand(2))
	end

end

test = Game.new
