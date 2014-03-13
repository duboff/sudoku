require_relative "./cell.rb"

class Grid
  attr_reader :cells

  def initialize(initial_values)
    @cells = []
    fill_cells(initial_values)
  end

  def fill_cells(vals)
    vals.each_char {|char| @cells << Cell.new(char.to_i)}
  end

  def rows
    cells.each_slice(9).to_a
  end

  def cols
    rows.transpose
  end

  def boxes
    threes = cells.each_slice(3).to_a
    boxes = Array.new(9, [])
    for i in 0...9
      boxes[i] = threes[0] + threes[3] + threes[6]
      threes.rotate!
    end
    boxes
  end

  def generate_neigbours(cell)
    result = [] +
                rows.select {|row| row.include?(cell) }.flatten +
                cols.select {|col| col.include?(cell) }.flatten +
                boxes.select {|box| box.include?(cell) }.flatten
    cell.neighbours = result.map {|cell| cell.value}.uniq.sort
  end





  # def solve
  #   outstanding_before, looping = SIZE, false
  #   while !solved? && !looping
  #     try_to_solve # ask each cell to solve itself
  #     outstanding         = @cells.count {|c| c.solved? }
  #     looping             = outstanding_before == outstanding       
  #     outstanding_before  = outstanding     
  #   end 
  # end

  def solved?
    cells.all? { |cell| cell.solved? }
  end

  # def inspect
  #   # iterate over all cells and print the grid
  # end
end


