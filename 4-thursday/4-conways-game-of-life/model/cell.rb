
require "pry"

class Cell
  attr_reader :alive

  def initialize(alive)
      @alive = alive
    end

    def regenerate(neighbours)
      die_or_live(neighbours)
      self
    end

    private

    def live_neighbour_amount(neighbours)
      neighbours.select { |n| n.alive}.size
    end

    def die_or_live(neighbours)
      if @alive
        return @alive = false if live_neighbour_amount(neighbours) < 2
        return @alive if [2, 3].include?(live_neighbour_amount(neighbours))
        return @alive = false if live_neighbour_amount(neighbours) > 3
      else
        if live_neighbour_amount(neighbours) == 3
          return @alive = true
        end
      end
      @alive
    end
end
