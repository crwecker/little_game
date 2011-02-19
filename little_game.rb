#######################################
## Initialize Game (Copying Sams Game format and all (: )

$:.unshift File.join( File.dirname(__FILE__), "lib" ) #load from lib directory

## Load libraries...
require 'robot.rb'

#######################################
## Game starts here

$robot = Robot.new
$running = true
prompt = nil

#######################################
## Command line and commands
Thread.new do
	while true
		$>.flush
		print $robot.name + " >"
		$>.flush
		prompt = $<.gets

		##Change Name
			#"rename"
		if prompt =~ /^\s*rename/i
			name = $1
			$command = Proc.new{ $robot.rename }

		#Exit game
		#"exit"
		elsif prompt =~ /^\s*exit/i
			$command = Proc.new{ $running = false }
		else
			$command = Proc.new{ puts "huh? Sorry, I don't know what #{prompt} means!" }
		
		end
	end
end

while $running
	start_time = Time.now
	if !$command.nil?
		$command.call
		$command = nil
	end
	left_over_time = (0.1 - (Time.now - start_time))
	sleep(left_over_time)
end
 
