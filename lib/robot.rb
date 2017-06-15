class Robot
	attr_accessor :errors

  def initialize input
    place_robot input
  end

	def position= input
		place_robot input
  end

	# place robot in 5x5 square tabletop
	def place_robot input
		@input = input
    assign_input
    to_place? ? progress : @errors = 'I only accept PLACE with co-ordinates'
	end

  def progress
    @x, @y, @f = @position.split(',')
    unless valid_position && valid_point
      @errors = 'Please provide valid position'
    end
  end

	# change direction of robot
	def move_a_unit
		direction = @f.downcase
		case direction
		when 'n' then
			@x = @x.to_i + 1
		when 's' then
			@x = @x.to_i - 1
		when 'e' then
			@y = @y.to_i + 1
		when 'w' then
			@y = @y.to_i - 1
		end
		byebug
	end

	# move robot
	def move
		# cache current coordinates
		# in case falls off
		current_x, current_y = @x, @y
		move_a_unit

		unless valid_position
			@x, @y = current_x, current_y
			@errors = true
		end
	end

	def left
		nswe = { 'n' => 'w', 's' => 'e', 'w' => 's', 'e' => 'n' }
		progress
		@f = nswe[@f.downcase]
	end

	def right
		nswe = { 'n' => 'e', 's' => 'w', 'w' => 'n', 'e' => 'n' }
		progress
		@f = nswe[@f.downcase]
	end

  # check validity of command and position
  def assign_input
    input = @input.split
    @command, @position = input[0], input[1]
  end

  # check validity of co-ordinates
  def valid_position
		begin
    	[@x,@y].all? do |coordinate|
				value = Integer(coordinate)
				(0..5).include?(value)
			end
		rescue ArgumentError
			@errors = 'Accept integers but saw a string or an unkown format'
		end
  end

  def to_place?
    @command.downcase.eql? 'place'
  end

  def valid_point
    ['n', 's', 'w', 'e'].include?(@f.downcase)
  end

  def valid?
    @errors.nil?
  end

	def report
		"#{@x} #{@y} #{@f}"
	end
end
