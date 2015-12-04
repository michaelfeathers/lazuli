

require 'unimidi'

class OutPort
  def initialize output = UniMIDI::Output.first
    @output = output
  end

  def send_on note, velocity
    @output.puts(0x90, note, velocity)
  end
end

