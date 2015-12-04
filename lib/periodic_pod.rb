
require 'pod'

class PeriodicPod < Pod

  def initialize
    @iteration = 0
  end

  def next_value
    @iteration = @iteration + 1 
    ((@iteration - 1) % 3) == 0 ? NoteCommand.new : EmptyCommand.new
  end

end
