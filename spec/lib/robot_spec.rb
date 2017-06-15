require 'spec_helper'
require 'robot'

RSpec.describe Robot do
  describe 'PLACE command' do
    before(:example) do
      @robot = Robot.new 'place 0,0,e'
    end

    it 'valid start' do
      expect(@robot.valid?).to be_truthy
    end

    it 'invalid start' do
      position = 'place 0,z,n'
      @robot.position = position
      expect(@robot.valid?).to be_falsy
    end
  end

	describe 'MOVE' do
		it 'robot in boundary' do
			robot = Robot.new 'place 1,2,E'
			robot.move
			robot.move
			robot.left
			robot.move
			expect(robot.report).to eql('3,3,n')
		end

		it 'robot out of boundary' do
			robot = Robot.new 'place 5,0,n'
			robot.move
			expect(robot.valid?).to be_falsy
		end

		it 'valid left/right' do
			robot = Robot.new 'place 0,4,n'
			robot.left
			robot.move
			expect(robot.valid?).to be_truthy
			expect(robot.report).to eql('0 3 w')
		end

	end

	describe 'invalid' do
    it 'first/position command' do
      robot = Robot.new 'move 0,0,n'
      expect(robot.valid?).to be_falsy

			robot.position = 'place 10,0,n'
      expect(robot.valid?).to be_falsy
    end

    it 'position with valid command' do
      robot = Robot.new 'place 10,0,x'
      expect(robot.valid?).to be_falsy
    end
  end
end
