
class IdManager
  def initialize(starting_number)
    @next_id = starting_number
  end
  
  def next_id
    result_id = @next_id
    @next_id += 1
    return result_id
  end
end
