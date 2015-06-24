
class Lexiconomitron
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  def initialize(letter)
    @letter = letter.downcase
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

  def supercounter(words)
    words = eat_letter(words.join(""))
    sum = 0
    (0.upto(words.size-1)).each do |letter_index|
      if before_letter?(words[letter_index])
        sum += 1

      end
    end
    sum
  end

  private

  def eat_letter(word)
    word.downcase.tr(@letter, "")
  end

  def before_letter?(letter)
    if ALPHABET.index(letter.downcase) < ALPHABET.index(@letter)
      return true
    end
    false
  end
  
end
