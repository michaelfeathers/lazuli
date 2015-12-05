
require 'pod'
require 'commands'

class PeriodicPod < Pod

  def initialize pattern, period
    @pattern = pattern
    @period = period
    @iteration = 0
    @position = 0
  end

  def next_command
    command = at_start? ? NoteCommand.new(@pattern[@position]) : EmptyCommand.new
    advance
    command
  end

private
  def advance
    @iteration = @iteration + 1
    @position = (@position + 1) % @pattern.count
  end


  def at_start?
    @iteration % @period == 0
  end
end
