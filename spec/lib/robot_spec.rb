require 'spec_helper'
require 'robot'

RSpec.describe Robot do
  describe 'PLACE command' do
    before(:example) do
      @robot = Robot::State.new 'place 0,0,east'
    end

    it 'starts with valid input' do
      expect(@robot.valid?).to be_truthy
      expect(@robot.report).to eql('0, 0, EAST')
    end
  #
  #   it 'starts with invalid input' do
  #     @robot = Robot::State.new 'place 0,z,east'
  #     @robot.position = 'move 0,z,north'
  #     expect(@robot.valid?).to be_falsy
  #   end
  #
  #   it 'starts with inadequate input' do
  #     @robot = Robot::State.new 'place'
  #     expect(@robot.valid?).to be_falsy
  #   end
  # end
  #
  # describe 'MOVE' do
  #   before(:example) do
  #     @robot = Robot::State.new 'place 1,4,north'
  #   end
  #
  #   it 'one unit North' do
  #     robot = Robot::State.new 'place 0,0,North'
  #     robot.move
  #     expect(robot.report).to eql('0, 1, NORTH')
  #
  #     robot.move
  #     robot.move
  #     expect(robot.report).to eql('0, 3, NORTH')
  #   end
  #
  #   it 'left/right within boundary' do
  #     @robot.left
  #     @robot.move
  #     expect(@robot.valid?).to be_truthy
  #     expect(@robot.report).to eql('0, 4, WEST')
  #
  #     robot = Robot::State.new 'place 1,4,NORTH'
  #     robot.right
  #     robot.move
  #     expect(robot.valid?).to be_truthy
  #     expect(robot.report).to eql('2, 4, EAST')
  #   end
  #
  #   it 'out of boundary' do
  #     robot = Robot::State.new 'place 5,0,EAST'
  #     robot.move
  #     expect(robot.valid?).to be_falsy
  #     expect(robot.report).to eql('5, 0, EAST')
  #
  #     robot = Robot::State.new 'place 5,0,EAST'
  #     robot.right
  #     robot.move
  #     expect(robot.report).to eql('5, 0, SOUTH')
  #     expect(robot.valid?).to be_falsy
  #   end
  # end
  #
  # describe 'invalid' do
  #   it 'first/position command' do
  #     robot = Robot::State.new 'move 0,0,NOR'
  #     expect(robot.valid?).to be_falsy
  #
  #     robot.position = 'place 10,0,NORTH'
  #     expect(robot.valid?).to be_falsy
  #   end
  #
  #   it 'position with valid command' do
  #     robot = Robot::State.new 'place 3,0,x'
  #     expect(robot.valid?).to be_falsy
  #   end
  # end
  #
  # context 'example input and output' do
  #   it 'first example' do
  #     robot = Robot::State.new 'place 0,0,NORTH'
  #     robot.left
  #     expect(robot.report).to eql('0, 0, WEST')
  #   end
  #
  #   it 'second example' do
  #     robot = Robot::State.new 'place 1,2,east'
  #     robot.move
  #     robot.move
  #     robot.left
  #     robot.move
  #     expect(robot.report).to eql('3, 3, NORTH')
  #   end
  end
end
