
require "pry"

class Cell
  def initialize(alive, neighbours)
      @alive = alive
      @neighbours = neighbours
    end

    def regenerate
      if @alive
        return @alive = false if live_neighbour_amount < 2
        return @alive if [2, 3].include?(live_neighbour_amount)
        return @alive = false if live_neighbour_amount > 3
      else
        return @alive = true if live_neighbour_amount == 3
      end

    end

    private

    def live_neighbour_amount
      @neighbours.select { |n| n}.size
    end
end
