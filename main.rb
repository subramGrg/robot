require './lib/robot'

def main
	puts "\nToy Robot Simulator\nTo place Robot on tabletop use:\nplace x,y,f\nWarning: Commands apart from place will not work\n\n"

	prompt = gets.chomp
	robot = Robot.new prompt

	puts robot.errors; return unless robot.valid?

	command = 'y'
	while !command.eql? 'n' do
		puts "\n\nAccepted commands: \n\ni) place x,y,f \nii) MOVE \nii) LEFT \niv) RIGHT \nv) REPORT\nTo move robot use the accepted commands given above:\n\nTo exit (press n):\n"
		command = gets.chomp
		command.downcase!

		case
		when command.include?('place')
			robot.position = command
		when command.eql?('move')
			robot.move
		when command.eql?('left')
			robot.left
		when command.eql?('right')
			robot.right
		when command.eql?('report')
			puts "\n\nRobots current position #{robot.report}\n\n\n"
		else
		end
	end
end

main
