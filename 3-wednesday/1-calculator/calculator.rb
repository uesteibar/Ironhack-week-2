require "pry"
class Calculator
  def sum(a, b)
    return a if b.nil? && a.is_a?(Numeric)
    return b if a.nil? && b.is_a?(Numeric)
    return unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a + b
  end

  def substract(a, b)
    return unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a - b
  end

  def multiply(a, b)
    return unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a * b
  end

  def divide(a, b)
    return unless a.is_a?(Numeric) && b.is_a?(Numeric)
    return if b == 0
    a.to_f / b.to_f
  end

  def mode(numbers)
    return unless are_all_numeric?(numbers)

    most_frequent = { number: nil, occurrences: 0 }
    numbers.each do |number|
      if number != most_frequent[:number]
        end
        number_frequency = numbers.count(number)
        if number_frequency > most_frequent[:occurrences]
          most_frequent = { number: number, occurrences: number_frequency }
      end
    end
    most_frequent[:number]
  end

  def average(numbers)
    return unless are_all_numeric?(numbers)
    sum = numbers.reduce(0) { |sum, number| sum += number }
    divide(sum.to_f, numbers.size)
  end

  def median(numbers)
    return unless numbers.size > 0
    return unless are_all_numeric?(numbers)
    numbers.sort!
    if numbers.size.odd?
      numbers[(numbers.size / 2)]
    else
      average([numbers[(numbers.size / 2)] - 1, numbers[(numbers.size / 2)]])
    end
  end

  private

  def are_all_numeric?(array)
    return false if (array.select { |item| !item.is_a?(Numeric) }).size > 0
    true
  end
end
