
class MemoryFileStorage
  def initialize(filepath)
    @filepath = filepath
  end
  
  def get
    IO.read(@filepath)
  end

  def put(number)
    IO.write(@filepath, number)
  end
end
