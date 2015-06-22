
class MemoryHandler
  def initialize(storage_provider)
    @storage_provider = storage_provider
  end
  
  def get
    @storage_provider.get
  end

  def put(number)
    @storage_provider.put(number)
  end
end
