
require "./model/grid"
require "./model/cell"

describe Grid do
  describe '#turn' do
    it 'should regenerate every cell acording to the rules' do
      grid = Grid.new([
        [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(false), Cell.new(false)],
        [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
        [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
        [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false)],
        [Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(false), Cell.new(true)]
        ])
      expect(grid.turn).to eq([
        [true, true, false, false, false],
        [false, true, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false],
        [true, true, false, false, false]])
    end
  end
end
