module Mechanics

	WIN_CONDITIONS = {
		rows:      [ [:TL, :TM, :TR], [:ML, :MM, :MR], [:BL, :BM, :BR] ],
		columns:   [ [:TL, :ML, :BL], [:TM, :MM, :BM], [:TR, :MR, :BR] ],
		diagonals: [ [:TL, :MM, :BR], [:TR, :MM, :BL] ]	
	}

	def get_valid_choice_for(player)
		puts "Enter square to place an #{player.symbol.upcase}:"	
		choice = gets.chomp.upcase.to_sym
		legit_moves = /^[TMB][LMR]$/

		if choice =~ legit_moves && @game.board[choice] == @game.empty_square
			return choice
		elsif (choice =~ legit_moves) == nil
			puts "Invalid move! Not a valid square."
			get_valid_choice_for(player)
		elsif @game.board[choice] != @game.empty_square
			puts "Invalid move! Square already taken."
			get_valid_choice_for(player)
		end
	end

	def win?(player)
		WIN_CONDITIONS.any? do |type, set|
			set.any? do |win|
				win.all? { |square| @game.board[square] == player.symbol }
			end
		end
	end

	def draw?
		if @game.board.length >= 9
			return true
		else 
			return false
		end
	end

	def game_over?(player)
		if win?(player)
			puts ">>> GAME OVER. #{player.name} (#{player.symbol.upcase}) wins! \n\n"
			return true
		elsif draw?
			puts ">>> GAME OVER. Draw <<< \n\n"
			return true
		else 
			return false
		end
	end

	def turn(counter)
		player = @player_array[counter % 2]

		@game.draw
		puts ">>> #{player.name}'s turn."	
		move = get_valid_choice_for(player)

		@game.update(move, player.symbol)
		@game.draw


		unless game_over?(player)
			counter += 1
			turn(counter)
		end
	end
end