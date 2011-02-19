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
#Thread.new do
	while true
		$>.flush
		print $robot.name + " >"
		$>.flush
		prompt = $<.gets

		##Change Name
			#"rename"
		if prompt =~ /^\s*rename/i
			$command = Proc.new{ $robot.rename }

		elsif prompt =~  /^\s*get_name/i
			$command = Proc.new{ puts "Why, you are #{$robot.name}"}


		#Exit game
		#"exit"
		elsif prompt =~ /^\s*exit/i
			#$command = Proc.new{ $running = false }
			return nil
			
		else
			$command = Proc.new{ puts "huh? Sorry, I don't know what #{prompt} means!" }
		end		
		#if $running
		#	start_time = Time.now
		#	puts "start_time: #{start_time}"	#Debug
		if !$command.nil?
			$command.call
			$command = nil
		end
		#	left_over_time = (1 - (Time.now - start_time))
		#	puts "left over time: #{left_over_time}"	#Debug

		#	sleep(left_over_time)
		#end

	end
#end
