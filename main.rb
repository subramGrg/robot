require './lib/robot_position'
require './lib/robot_state'
require './lib/helper'

require 'yaml'
commands = YAML.load_file("./lib/input.yml")

def main
	prompt = gets.chomp
	robot = Robot::State.new prompt

	puts robot.errors; return unless robot.valid?

	command = 'y'
	while !command.eql? 'n' do
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
