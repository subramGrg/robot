module Robot
  class << self
    attr_reader :errors

    # position robot
    def position input, &block
      self.errors = nil
      @command, @position = helper.split(input)

      progress
    end

    def progress
      if place?
        @x, @y, @face = @position.split(',')
        @face.downcase!

        unless helper.valid?(position: [@x, @y], face: @face)
          self.errors = 'Please provide valid position/coordinates'
        end
      else
        self.errors = 'I only accept PLACE with co-ordinates'
      end
    end

    # check if command matches place
    def place?
      @command.downcase.eql? 'place'
    end

    # move robot a unit in the direction it faces
    def move_a_unit
      case @face
      when 'n' then
        @y = @y.to_i + 1
      when 's' then
        @y = @y.to_i - 1
      when 'e' then
        @x = @x.to_i + 1
      when 'w' then
        @x = @x.to_i - 1
      end

      self.errors = 'Out of bounds' unless helper.position_valid? [@x, @y]
    end

    # change robots face
    def face &block
      @face = block.call(@face) if block_given?
    end

    def errors?
      errors.nil?
    end

    def errors= message
      @errors = message
    end

    def coordinates
      "#{@x}, #{@y}, #{@face}"
    end
  end
end
