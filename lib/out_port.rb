

require 'unimidi'

class OutPort

  MIDI_ON = 0x90
  MIDI_OFF = 0x80

  def initialize output = UniMIDI::Output.first
    @output = output
    @active_notes = {}
  end

  def send_on note, velocity
    @output.puts(MIDI_ON, note, velocity)
    @active_notes[note] = velocity
  end

  def send_off note, velocity
    @output.puts(MIDI_OFF, note, velocity)
    @active_notes.delete(note)
  end

  def clear
    @active_notes.each do |note, velocity|
      @output.puts(MIDI_OFF, note, velocity)
    end
    @active_notes = {}
  end
end

