
class Calculator
  def initialize(operations)
    @operations = operations
  end

  def execute(operation, a, b)
    @operations[operation.to_sym].call(a, b)
  end
end
