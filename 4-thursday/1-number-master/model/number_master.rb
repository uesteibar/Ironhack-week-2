
require "pry"

class NumberMaster
  def polarize(numbers)
    return if numbers.nil? || numbers.empty?
    numbers = clean_numbers(numbers)
    polarization = count_negatives_positives(numbers)
    if polarization[:positives] > polarization[:negatives]
      return numbers.select { |number| number > 0 }
    elsif polarization[:positives] < polarization[:negatives]
      return numbers.select { |number| number < 0 }
    else
      return nil
    end
  end

  def super_calculation(numbers)
    results = []
    results << mode(numbers)

    results << median(numbers)

    result << mean(numbers)
  end

  private

  def count_negatives_positives(numbers)
    polarization = {
      positives: 0,
      negatives: 0
    }
    numbers.each do |number|
      if number > 0
        polarization[:positives] += 1
      elsif number < 0
        polarization[:negatives] += 1
      end
    end
    polarization
  end

  def clean_numbers(numbers)
    numbers.select { |number| number.is_a?(Numeric) }
  end

  def mode(numbers)
    count = Hash.new(0)
    results = []
    numbers.each {|number| count[number] += 1}
    count = count.sort_by { |k,v| v }.reverse
    results << count.first
    i = 1
    while count[i][1] == results[0][1]
      results << count[i]
      i += 1
    end
    results.map { |key_value| key_value[0] }
  end

  def mean(numbers)
    numbers.inject(:+) / numbers.size
  end

  def median(numbers)
    numbers.sort!
    median = if numbers.size.even?
    else
      sorted_numbers[numbers.size / 2]
  end
end
