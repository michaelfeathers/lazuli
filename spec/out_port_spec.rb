

require 'out_port'

describe OutPort do

  before(:each) do 
    @midi_out = double 
    @port = OutPort.new(@midi_out)
  end

  it 'sends a midi note-on event' do
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_ON, 40, 100)
    @port.send_on(40, 100)
  end

  it 'sends a midi note-off event' do
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_OFF, 40, 100)
    @port.send_off(40, 100)
  end

  it 'clears all playing notes' do
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_ON, 40, 100)
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_OFF, 40, 100)
    @port.send_on(40, 100)
    @port.clear
  end

  it 'does not clear notes that have been turned off' do
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_ON, 40, 100)
    expect(@midi_out).to receive(:puts).with(OutPort::MIDI_OFF, 40, 100)
    @port.send_on(40, 100)
    @port.send_off(40, 100)
    @port.clear
  end

end
