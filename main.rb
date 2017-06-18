require './lib/robot_position'
require './lib/robot_state'
require './lib/helper'
require 'yaml'

def main
  commands = YAML.load_file("./lib/input.yml")

  # the following mimic's user entering commands
  # however here commands are read from YAML instead
  commands.each do |test_case|
    puts "\n#{test_case[0]}"
    test_case[1].each do |cmd|
      case
      when cmd.include?('place')
        @robot = Robot::State.new cmd
      when cmd.eql?('move')
      	@robot.move
      when cmd.eql?('left')
      	@robot.left
      when cmd.eql?('right')
      	@robot.right
      when cmd.eql?('report')
      	puts "Robots current position => '#{@robot.report}'\n\n"
      else
      end
    end
  end
end
main
