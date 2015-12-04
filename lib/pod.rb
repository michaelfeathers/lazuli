

class Pod
  def each
    return enum_for(:each) unless block_given?

    loop do
      yield EmptyCommand.new
    end
  end
end
