module Robot
	class << self
		# position robot
		def position input, &block
			@errors = nil
			split(input)
			progress
		end

		def progress
			if place?
				@x, @y, @face = @position.split(',')
				@face.downcase!

				unless valid_position? && valid_face?
					@errors = 'Please provide valid position'
				end
			else
				@errors = 'I only accept PLACE with co-ordinates'
			end
		end

		# check validity of command and position
	  def split input
	    input = input.split
	    @command, @position = input[0], input[1]
	  end

		# check if command matches place
	  def place?
	    @command.downcase.eql? 'place'
	  end

		# move robot a unit in the direction its facing
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

			@errors = 'Out of bounds' unless valid_position?
		end

		# check if face entered is valid
	  def valid_face?
	    ['n', 's', 'w', 'e'].include? @face
	  end

	  # check validity of co-ordinates
	  def valid_position?
			begin
	    	[@x,@y].all? do |coordinate|
					value = Integer(coordinate)
					(0..5).include?(value)
				end
			rescue ArgumentError
				@errors = 'Accept integers but saw a string or an unkown format'
			end
	  end

		# change robots face
		def face &block
			@face = block.call(@face) if block_given?
		end

		def errors?
	    @errors.nil?
	  end

		def coordinates
			"#{@x}, #{@y}, #{@face}"
		end
	end
end
