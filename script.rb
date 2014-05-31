def random_choice
	choice = ["X", "O"].sample
	choicex = rand(3)
	choicey = rand(3)
	{ :x => choicex, :y => choicey, :what => choice}
end

system "clear"
load './board.rb'
test = Game.new
test.draw

again = true

while again do
	turn = random_choice

	test.update(turn[:x], turn[:y], turn[:what])
	test.draw

	puts "Again?"
	again = false unless gets.chomp == "y"
end

