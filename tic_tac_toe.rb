class Game
	require_relative 'board.rb'
	require_relative 'player.rb'
	# require Board
	# require Player

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

		# puts [@xplayer.name, @xplayer.symbol, @oplayer.name, @oplayer.symbol]
	end

	def game_over?

	end

	def turn(player)
		@gameboard.draw
		puts "Game time!! #{player.name} goes first!"
		puts "Enter square to place an #{player.symbol}:"
		choice = gets.chomp.upcase.to_sym
		@gameboard.update(choice, player.symbol)
		@gameboard.draw
	end

	def initialize
		self.setup
		@gameboard = Board.new
		self.turn([@xplayer, @oplayer].sample)
	end

end

test = Game.new
