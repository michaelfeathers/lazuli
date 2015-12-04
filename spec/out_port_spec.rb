

require 'out_port'

describe OutPort do

  it 'sends a midi-on event' do
    midi_out = double
    expect(midi_out).to receive(:puts).with(0x90, 40, 100)
    OutPort.new(midi_out).send_on(40, 100)
  end

end
