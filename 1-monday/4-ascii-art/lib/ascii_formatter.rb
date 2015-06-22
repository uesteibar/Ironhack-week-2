
require "artii"

class AsciiFormatter
  def initialize(text)
    @text = text
  end

  def format
    Artii::Base.new.asciify(@text)
  end
end
