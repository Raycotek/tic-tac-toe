module Graphics

	HLINE = "\u2500"
	VLINE = "\u2502"
	CROSS = "\u253C"
	SPACER = " " * 15
		
	def set_table(object)
		[
			[object[:TL], VLINE, object[:TM], VLINE, object[:TR]],
			[HLINE, CROSS, HLINE, CROSS, HLINE],
			[object[:ML], VLINE, object[:MM], VLINE, object[:MR]],
			[HLINE, CROSS, HLINE, CROSS, HLINE],
			[object[:BL], VLINE, object[:BM], VLINE, object[:BR]]
		]
	end

	def draw_row(line)
		puts SPACER + " " + line.join(" ").upcase + "\n" if line[0].class == Symbol
		puts SPACER + HLINE + line.join(HLINE) + HLINE + "\n" if line[0] == HLINE
	end

	def display(object)
		table = set_table(object)

		system "clear"
		puts ""
		table.each do |line| 
			draw_row(line)
		end
		puts ""
	end

end