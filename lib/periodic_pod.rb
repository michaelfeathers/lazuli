
require 'pod'

class PeriodicPod < Pod

  def initialize pattern, period
    @pattern = pattern
    @period = period
    @iteration = 0
    @position = 0
  end

  def next_value
    @iteration = @iteration + 1
    return EmptyCommand.new unless (@iteration - 1) % @period == 0
    command = NoteCommand.new(@pattern[@position])
    @position = (@position + 1) % @pattern.count
    command
  end
end
