module Robot
  class << self
    attr_reader :errors

    # position robot
    def position input, &block
      self.errors = nil
      @command, @position = helper.split(input)

      # only progress if valid command is entered
      progress if command_present?
    end

    def progress
      if place?
        @x, @y, @face = @position.split(',')
        @face.downcase!

        unless helper.valid?(position: [@x, @y], face: @face)
          self.errors = 'Coordinates is out of boundary/Face unaccepted'
          # place robot in 0,0
          @x, @y = '0','0'
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
      # only progress if valid command is entered
      return unless command_present?
      # cache coordinates if robot moves out of boundary
      helper.cache [@x, @y]

      case @face
      when 'north' then
        @y = @y.to_i + 1
      when 'south' then
        @y = @y.to_i - 1
      when 'east' then
        @x = @x.to_i + 1
      when 'west' then
        @x = @x.to_i - 1
      end

      unless helper.valid? position: [@x, @y]
        self.errors = 'Out of bounds'
        @x, @y = helper.cache
      end
    end

    # change robots face
    def face &block
      @face = block.call(@face) if block_given?
    end

    def errors?
      errors.nil?
    end

    def command_present?
      if @command.nil? # true
        @x, @y, @face = nil, nil, nil
        self.errors = 'Cannot compute this command'
        false
      else
        true
      end
    end

    def errors= message
      @errors = message
    end

    def coordinates
      if @x && @y && @face
        "#{@x}, #{@y}, #{@face.upcase}"
      else
        "Im not on the board"
      end
    end
  end
end
