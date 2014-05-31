class GameBoard

	def initialize
		blank = "\u0020" * 3
		verti = "\u2503"
		horiz = "\u2501" * 3
		cross = "\u254B"

		@board = [
			[ blank, verti, blank, verti, blank ],
			[ horiz, cross, horiz, cross, horiz ],
			[ blank, verti, blank, verti, blank ],
			[ horiz, cross, horiz, cross, horiz ],
			[ blank, verti, blank, verti, blank ]
		]

		@play_area = {
			:x => [0, 2, 4],
			:y => [0, 2, 4]
		}
	end

	def update(x_coord, y_coord, x_or_o)
		a = {:x => nil, :y => nil}
		a[:x] = @play_area[:x][x_coord]
		a[:y] = @play_area[:y][y_coord]
		@board[a[:y]][a[:x]] = " #{x_or_o} "
		puts a
	end

	def draw
		system "clear"
		@board.each do |line|
			puts line.join + "\n"
		end
		return nil
	end

end