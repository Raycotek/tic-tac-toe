def random_choice
	choice = ["X", "O"].sample
	choicex = rand(3)
	choicey = rand(3)
	{ :x => choicex, :y => choicey, :what => choice}
end
load './tic_tac_toe.rb'
test = Game.new

