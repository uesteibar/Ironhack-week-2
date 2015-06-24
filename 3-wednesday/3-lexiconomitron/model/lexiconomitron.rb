
class Lexiconomitron
  def initialize(letter)
    @letter = letter
  end
  
  def shazam(words)
    words.map! do |word|
      eat_letter(word).reverse
    end
    [words[0], words[-1]]
  end

  def oompa_loompa(words)
    words.select! { |word| word.size <= 3 }
    words.map! do |word|
      eat_letter(word)
    end
  end

  def all_in_line(words, delimiter)
    words.sort_by! { |word| -word.size }
    eat_letter(words.join(delimiter))
  end

  private

  def eat_letter(word)
    word.downcase.tr(@letter, "")
  end
  
end
