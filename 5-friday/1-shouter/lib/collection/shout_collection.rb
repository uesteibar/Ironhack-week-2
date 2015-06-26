
class ShoutCollection
  def initialize(shouts)
    @shouts = shouts
    @sort_methods = {
      date: -> { @shouts.sort_by {|s| s.created_at }.reverse },
      likes: -> { @shouts.sort_by {|s| s.likes }.reverse }
    }
  end

  def by(symbol)
    @sort_methods[symbol].call
  end
end
