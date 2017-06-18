module Robot
  class State
    def initialize input
      before_position_check input
    end

    # set position of robot on 5x5 square tabletop
    def position= input
      before_position_check input
    end

    def before_position_check input
      @input = input
      place
    end

    # place robot in 5x5 square tabletop
    def place
      Robot.position(@input)
    end

    # move robot
    def move
      Robot.move_a_unit
    end

    # rotate robot left
    def left
      nesw = { 'n' => 'w', 's' => 'e', 'w' => 's', 'e' => 'n' }
      Robot.face do |face|
        nesw[face]
      end
    end

    # rotate robot right
    def right
      nesw = { 'n' => 'e', 's' => 'w', 'w' => 'n', 'e' => 's' }
        Robot.face do |face|
        nesw[face]
      end
    end

    # check for any errors
    # it is valid if no error exist
    def valid?
      Robot.errors?
    end

    # return current position of robot
    def report
      Robot.coordinates
    end
  end
end
