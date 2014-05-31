system "clear"
load './board.rb'
test = GameBoard.new
test.draw

puts "Place what?"
choice = gets.chomp[0]
puts "Place where? (x-axis)"
choicex = gets.chomp.to_i
puts "Place where? (y-axis)"
choicey = gets.chomp.to_i

test.update(choicex, choicey, choice)
test.draw