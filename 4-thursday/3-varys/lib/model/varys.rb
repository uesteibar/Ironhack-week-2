
class Varys
  # Say the name of the character
  def say_my_name!
    "I am Varys, and I'm here to say what you want to hear."
  end

  # Flatter Cersei
  def say_cersei_rocks!
    "Cersei rocks!"
  end

  # Flatter Joffrey
  def say_joffrey_rocks!
    "Joffrey rocks!"
  end

  # Upon receiving a list of words, reverse them and return only the ones
  # which have five letters or more
  def backwards_wording(words)
    words.select { |word| word.size >= 5 }.map { |word| word.reverse }
  end

  # Upon receiving a list of float numbers, return a portion of them. If it is
  # Friday, return the ones that are below 0. Otherwise, return the ones above
  # or equal 0.
  def friday_numbers(numbers)
    is_friday? ? numbers.select { |number| number < 0 } : numbers.select { |number| number >= 0 }
  end

  private

  def is_friday?
    Time.now.friday?
  end
end
