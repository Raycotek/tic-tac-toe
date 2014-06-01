def random_choice
	choice = ["X", "O"].sample
	choicex = rand(3)
	choicey = rand(3)
	{ :x => choicex, :y => choicey, :what => choice}
end

system "clear"
load './board.rb'
test = Board.new
test.draw

puts "Continue?"
gets.chomp

test.update(:MM, "x")
test.draw
