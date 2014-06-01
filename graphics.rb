module Graphics

	@@hline = "\u2500"
	@@vline = "\u2502"
	@@cross = "\u253C"
		
	def display(object)
		@@board_display = [
			[object[:TL], @@vline, object[:TM], @@vline, object[:TR]],
			[@@hline, @@cross, @@hline, @@cross, @@hline],
			[object[:ML], @@vline, object[:MM], @@vline, object[:MR]],
			[@@hline, @@cross, @@hline, @@cross, @@hline],
			[object[:BL], @@vline, object[:BM], @@vline, object[:BR]]
		]

		system "clear"
		@@board_display.each do |line|	
			print line.join + "\n"
		end
		p object
	end

end