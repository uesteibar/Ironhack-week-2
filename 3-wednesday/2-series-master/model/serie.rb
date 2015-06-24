
class Serie
  attr_reader :id, :title, :rating

  def initialize(id, title, rating)
    @id = id
    @title = title
    @rating = rating
  end
end
