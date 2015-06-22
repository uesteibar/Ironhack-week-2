
class Task
  attr_reader :description, :priority
  def initialize(description, priority)
    @description = description
    @priority = priority # 1, 2 or 3
  end

  def print
    "#{@priority} - #{@description}"
  end
end
