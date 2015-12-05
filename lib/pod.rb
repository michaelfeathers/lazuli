

class Pod
  def each
    return enum_for(:each) unless block_given?
    loop do; yield next_command; end
  end

  def next_command
    EmptyCommand.new
  end
end
