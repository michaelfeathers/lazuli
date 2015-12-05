

class EmptyCommand
  def run port
  end
end


class NoteCommand
  def initialize note
    @note = note
  end

  def run port
    port.send_on(@note, 100)
  end
end


