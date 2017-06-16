module Robot
	class State
		def self.progress position, &block
			x, y, f = position.split(',')
			block.call(f) if block_given?

			# unless valid_position && valid_face
			# 	@errors = 'Please provide valid position'
			# end
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
	end
end
