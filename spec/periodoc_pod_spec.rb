

require 'periodic_pod'
require 'commands'

describe PeriodicPod do

  before(:each) do 
    @pod_stream = PeriodicPod.new.each
  end

  def note? command
    command.class.to_s == 'NoteCommand'
  end


  it 'patterns [1,0,0,1,0,0] on period 3' do
    pattern_of_six = @pod_stream.take(6).map {|c| note?(c) }
    expect(pattern_of_six).to eq([true, false, false, true, false, false])
  end

end
