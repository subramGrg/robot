module Robot
	class Position
		attr_accessor :errors
		attr_writer :f

	  def initialize input
	    before_position_check input
	  end

		def position= input
			# before_position_check input
	  end

		#
		def before_position_check input
			@input = input
	    split_input
	    place? ? place : @errors = 'I only accept PLACE with co-ordinates'
		end

		# place robot in 5x5 square tabletop
		def place
			Robot::State.progress(@position) do |face|
				byebug
				@f = face
			end
		end

		# check if command matches place
	  def place?
	    @command.downcase.eql? 'place'
	  end

		# check if face entered is valid
	  def valid_face
	    ['n', 's', 'w', 'e'].include?(@f.downcase)
	  end

	  # check validity of command and position
	  def split_input
	    input = @input.split
	    @command, @position = input[0], input[1]
	  end

	  # check validity of co-ordinates
	  # def valid_position
		# 	begin
	  #   	[@x,@y].all? do |coordinate|
		# 			value = Integer(coordinate)
		# 			(0..5).include?(value)
		# 		end
		# 	rescue ArgumentError
		# 		@errors = 'Accept integers but saw a string or an unkown format'
		# 	end
	  # end

		# check if there is any error present with the input
	  def valid?
	    @errors.nil?
	  end

		# return current position of robot
		def report
			"#{@x} #{@y} #{@f}"
		end
	end
end
