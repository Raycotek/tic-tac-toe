module Graphics

	@@hline = "\u2500"
	@@vline = "\u2502"
	@@cross = "\u253C"
	@@spacer = " " * 15
		
	def set_table(object)
		[
			[object[:TL], @@vline, object[:TM], @@vline, object[:TR]],
			[@@hline, @@cross, @@hline, @@cross, @@hline],
			[object[:ML], @@vline, object[:MM], @@vline, object[:MR]],
			[@@hline, @@cross, @@hline, @@cross, @@hline],
			[object[:BL], @@vline, object[:BM], @@vline, object[:BR]]
		]
	end

	def draw_row(line)
		puts @@spacer + " " + line.join(" ").upcase + "\n" if line[0].class == Symbol
		puts @@spacer + @@hline + line.join(@@hline) + @@hline + "\n" if line[0] == @@hline
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