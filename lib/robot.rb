class Robot
	def initialize
		puts "What would you like to be called?"
		print ">"
		name = STDIN.gets.chomp
		@name = name
		puts "Game on, bro! Welcome #{name}"
	end

	def rename
		puts "What now would you like to be called?"
		print ">"
		name = STDIN.gets.chomp
		@name = name
		puts "Game on, bro!"
	end

	attr_reader :name

end

