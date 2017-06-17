require 'spec_helper'
require 'robot_state'
require 'robot_position'

RSpec.describe Robot do
  describe 'PLACE command' do
    before(:example) do
      @robot = Robot::State.new 'place 0,0,e'
    end

    it 'valid start' do
      expect(@robot.valid?).to be_truthy
      expect(@robot.report).to eql('0, 0, e')
    end

    it 'invalid start' do
      position = 'move 0,z,n'
      @robot.position = position
      expect(@robot.valid?).to be_falsy
    end
  end

	describe 'MOVE' do
    before(:example) do
      @robot = Robot::State.new 'place 1,4,n'
    end

		it 'one unit North' do
			robot = Robot::State.new 'place 0,0,N'
			robot.move
			expect(robot.report).to eql('0, 1, n')

      robot.move
      robot.move
			expect(robot.report).to eql('0, 3, n')
		end

    it 'one unit North' do
			robot = Robot::State.new 'place 1,2,E'
      robot.move
      robot.move
      robot.left
      robot.move
			expect(robot.report).to eql('3, 3, n')
		end

		it 'left/right within boundary' do
			@robot.left
			@robot.move
			expect(@robot.valid?).to be_truthy
			expect(@robot.report).to eql('0, 4, w')

      robot = Robot::State.new 'place 1,4,n'
      robot.right
			robot.move
			expect(robot.valid?).to be_truthy
			expect(robot.report).to eql('2, 4, e')
		end

    it 'out of boundary' do
			robot = Robot::State.new 'place 5,0,e'
			robot.move
			expect(robot.valid?).to be_falsy

      robot = Robot::State.new 'place 5,0,e'
      robot.right
			robot.move
      expect(robot.report).to eql('5, -1, s')
      expect(robot.valid?).to be_falsy
		end
	end

	describe 'invalid' do
    it 'first/position command' do
      robot = Robot::State.new 'move 0,0,n'
      expect(robot.valid?).to be_falsy

			robot.position = 'place 10,0,n'
      expect(robot.valid?).to be_falsy
    end

    it 'position with valid command' do
      robot = Robot::State.new 'place 3,0,x'
      expect(robot.valid?).to be_falsy
    end
  end
end
