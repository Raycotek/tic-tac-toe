module Mechanics
	def get_valid_choice_for(player)
		puts "Enter square to place an #{player.symbol.upcase}:"	
		choice = gets.chomp.upcase.to_sym
		legit_moves = /^[TMB][LMR]$/

		if choice =~ legit_moves && @gameboard.board[choice] == @gameboard.empty_square
			return choice
		elsif (choice =~ legit_moves) == nil
			puts "Invalid move! Not a valid square."
			get_valid_choice_for(player)
		elsif @gameboard.board[choice] != @gameboard.empty_square
			puts "Invalid move! Square already taken."
			get_valid_choice_for(player)
		end
	end

	def game_over?
		state = false
		winning_conditions = {
			rows:      [ [:TL, :TM, :TR], [:ML, :MM, :MR], [:BL, :BM, :BR] ],
			columns:   [ [:TL, :ML, :BL], [:TM, :MM, :BM], [:TR, :MR, :BR] ],
			diagonals: [ [:TL, :MM, :BR], [:TR, :MM, :BL] ]	
		}
		winning_conditions.each do |key, win_parameters|
			win_parameters.each do |goal|
				state = true if goal.all? do |square| 
					@gameboard.board[square] == :x || @gameboard.board[square] == :o 
				end
			end
		end
		state
	end

	def turn(counter)
		player = @player_array[counter % 2]

		@gameboard.draw
		puts ">>> #{player.name}'s turn."	
		move = get_valid_choice_for(player)

		@gameboard.update(move, player.symbol)
		@gameboard.draw

		if game_over?
			puts "Game over! #{player.name} wins!"
		else
			counter += 1
			turn(counter)
		end
	end
end