
require "./model/cell"

describe Cell do
  describe '#regenerate' do
    context 'when the cell is live' do
      it "should regenerate a live cell if it has 2 or 3 neighbours" do
        cell = Cell.new(true, [false, false, false, false, false, false, true, true])
        expect(cell.regenerate).to eq(true)
      end

      it 'should regenerate a dead cell if it has less than 2 neighbours' do
        cell = Cell.new(true, [false, false, false, false, false, false, false, true])
        expect(cell.regenerate).to eq(false)
      end

      it 'should regenerate a dead cell if it has more than 3 neighbours' do
        cell = Cell.new(true, [false, false, false, true, true, true, true, false])
        expect(cell.regenerate).to eq(false)
      end
    end

    context 'when the cell is dead' do
      it 'should regenerate a live cell if it has exactly 3 neighbours' do
        cell = Cell.new(false, [false, false, false, true, true, true, false, false])
        expect(cell.regenerate).to eq(true)
      end
    end
  end
end
