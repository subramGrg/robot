module Robot
  def self.helper; Robot::Helper; end

  module Helper
    class << self
      # check validity of command and position
      def split input
        @input = input.split

        # validate if coordinates are provided
        if valid?(input: input)
          command, position = @input[0], @input[1..-1].join
        end
      end

      # check validity of input/position
      def valid? input: nil, position: nil, face: nil
        case
        when !input.nil?
          valid_input?
        when !position.nil? && !face.nil?
          @face = face
          face_valid? && position_valid?(position)
        when !position.nil?
          position_valid? position
        else
          'position or face not entered'
        end
      end

      # check face is of accepted value
      def face_valid?
        ['north', 'south', 'west', 'east'].include? @face
      end

      # check validity of co-ordinates
      def position_valid? coordinates
        x, y = coordinates
        begin
          [x,y].all? do |coordinate|
            value = Integer(coordinate)
            (0..5).include?(value)
          end
        rescue ArgumentError
          false
        end
      end

      def cache coordinates = nil
        if coordinates.nil?
          # return original coordinates
          [@x, @y]
        else
          # set original coordinates if
          # robot goes out of boundary
          @x, @y = coordinates
        end
      end

      # validate adequate command is given
      def valid_input?
        @input.length > 1
      end
    end
  end
end
