class Robot
	def initialize
		puts "What would you like to be called?"
		print ">"
		name = STDIN.gets.chomp
		@name = name
		puts "Game on, bro! Welcome #{name}"
	end

	def name( name )
		puts "What now would you like to be called?"
		print ">"
		name = $>.gets.chomp
		@name = name
		puts "Game on, bro!"
	end

end

