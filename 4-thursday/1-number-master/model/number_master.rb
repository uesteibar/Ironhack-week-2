
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
end
