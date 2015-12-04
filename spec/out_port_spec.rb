

require 'out_port'

describe OutPort do

  before(:each) do 
    @midi_out = double 
  end

  it 'sends a midi note-on event' do
    expect(@midi_out).to receive(:puts).with(0x90, 40, 100)
    OutPort.new(@midi_out).send_on(40, 100)
  end

  it 'sends a midi note-off event' do
    expect(@midi_out).to receive(:puts).with(0x80, 40, 100)
    OutPort.new(@midi_out).send_off(40, 100)
  end

end
