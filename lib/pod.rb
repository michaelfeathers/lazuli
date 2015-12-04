

class Pod
  def each
    return enum_for(:each) unless block_given?

    loop do
      yield next_value 
    end
  end


  def next_value
    EmptyCommand.new
  end
end
