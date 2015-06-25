
require "./model/grid"
require "./model/cell"
require "./formatter/multiline_formatter"

class Game
  def initialize(grid, formatter)
    @grid = grid
    @formatter = formatter
  end

  def run(times, frame_time)
    (0.upto(times)).each do
      @grid.turn
      puts @formatter.format(@grid.print)
      sleep(frame_time)
    end
  end
end

game = Game.new(Grid.new([
  [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(false)],
  [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(true)],
  [Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
  [Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false)],
  [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true)],
  [Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(true)],
  [Cell.new(false), Cell.new(false), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false), Cell.new(true)]
  ]), MultilineFormatter.new)

  game.run(100000, 1)
