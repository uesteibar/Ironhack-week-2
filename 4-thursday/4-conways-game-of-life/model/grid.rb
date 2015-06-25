
class Grid
  def initialize(cells)
    @cells = cells
  end

  def turn
    new_gens_cells = []
    @cells.each_with_index { |cell_row, x|
      new_gen_row = []
      cell_row.each_with_index { |cell, y|
        clone = cell.clone
        clone.regenerate(neighbors(x, y))
        new_gen_row << clone
        }
        new_gens_cells << new_gen_row
    }
    @cells = new_gens_cells
    return @cells.map { |cell_row| cell_row.map { |cell| cell.alive } }
  end

  def print
    system "clear"
    output = ""
    @cells.each do |row|
      row.each do |cell|
        output << "|#{cell.alive ? 'x' : ' '}"
      end
      output << "|\n"
    end
    output
  end

  private

  def neighbors(y, x)
    (-1..1).inject [] do |values, py|
      (-1..1).each do |px|
        unless py == 0 and px == 0
          i = y + py
          j = x + px
          i = 0 unless i < @cells.size
          j = 0 unless j < @cells[0].size
          values << @cells[i][j]
        end
      end
      values.map { |cell| cell }
    end
  end
end
