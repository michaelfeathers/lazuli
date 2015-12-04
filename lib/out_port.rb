

require 'unimidi'

class OutPort
  def initialize output = UniMIDI::Output.first
    @output = output
    @active_notes = {}
  end

  def send_on note, velocity
    @output.puts(0x90, note, velocity)
    @active_notes[note] = velocity
  end

  def send_off note, velocity
    @output.puts(0x80, note, velocity)
  end

  def clear
    @active_notes.each do |note, velocity|
      @output.puts(0x80, note, velocity)
    end
    @active_notes = {}
  end
end

