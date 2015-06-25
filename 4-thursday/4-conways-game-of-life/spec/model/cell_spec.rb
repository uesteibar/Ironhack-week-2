
require "./model/cell"

describe Cell do
  describe '#regenerate' do
    context 'when the cell is live' do
      it "should regenerate a live cell if it has 2 or 3 neighbours" do
        cell = Cell.new(true)
        expect(cell.regenerate(
        [Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(true),
          Cell.new(true)]).alive).to eq(true)
      end

      it 'should regenerate a dead cell if it has less than 2 neighbours' do
        cell = Cell.new(true)
        expect(cell.regenerate(
        [Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(true)]).alive).to eq(false)
      end

      it 'should regenerate a dead cell if it has more than 3 neighbours' do
        cell = Cell.new(true)
        expect(cell.regenerate(
        [Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(true),
          Cell.new(true),
          Cell.new(true),
          Cell.new(true),
          Cell.new(false)]).alive).to eq(false)
      end
    end

    context 'when the cell is dead' do
      it 'should regenerate a live cell if it has exactly 3 neighbours' do
        cell = Cell.new(false)
        expect(cell.regenerate(
        [Cell.new(false),
          Cell.new(false),
          Cell.new(false),
          Cell.new(true),
          Cell.new(true),
          Cell.new(true),
          Cell.new(false),
          Cell.new(false)]).alive).to eq(true)
      end
    end
  end
end
