module Robot
  def self.helper; Robot::Helper; end

  module Helper
  # check validity of command and position
  def self.split input
  input = input.split
  command, position = input[0], input[1..-1].join
  end

  # check validity of position
  def self.valid?(coordinates = {})
  if !coordinates.nil?
  return unless coordinates[:position] && coordinates[:face]

  #check if face & coordinates are valid
  @face = coordinates[:face]
  face_valid? && position_valid?(coordinates[:position])
  end
  end

  # check face is of accepted value
  def self.face_valid?
  ['n', 's', 'w', 'e'].include? @face
  end

  # check validity of co-ordinates
  def self.position_valid? coordinates
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
  end
end
