

require 'pod'

class EmptyCommand
end

describe Pod do

  before(:each) do 
    @pod = Enumerator.new do |e|
     loop do 
        e << EmptyCommand.new
      end
    end
  end

  it 'returns an empty command on an empty pattern' do
    expect(@pod.take(3).map(&:class).map(&:to_s)).to eq(['EmptyCommand'] * 3)
  end

end
