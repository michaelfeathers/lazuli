

require 'pod'

class EmptyCommand
end

describe Pod do

  before(:each) do 
    @pod_stream = Pod.new.each
  end

  it 'returns an empty command on an empty pattern' do
    expect(@pod_stream.take(3).map(&:class).map(&:to_s)).to eq(['EmptyCommand'] * 3)
  end

end
