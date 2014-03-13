require_relative "./cell.rb"

class Grid
  attr_reader :cells
  
  SIZE = 81
  def initialize(initial_values)
    @cells = initial_values.chars.map {|char| Cell.new(char.to_i) }
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
      threes.rotate!(7) if (i+1) % 3 == 0
      threes.rotate!(1) unless (i+1) % 3 == 0
    end
    boxes
  end

  def generate_neigbours(cell)
    result = rows.select {|row| row.include?(cell) } + cols.select {|col| col.include?(cell) } + boxes.select {|box| box.include?(cell) }
    cell.neighbours = result.flatten.map {|cell| cell.value}.uniq.sort
  end

  def try_to_solve
    cells.select{|cell| cell.value == 0}.each do |cell| 
      generate_neigbours(cell) 
      cell.solve
    end
  end

   def solve
     outstanding_before, looping = SIZE, false
     while !solved? && !looping
       try_to_solve # ask each cell to solve itself
       outstanding         = @cells.count {|c| c.solved? }
       looping             = outstanding_before == outstanding       
       outstanding_before  = outstanding     
     end 
   end

  def solved?
    cells.all? { |cell| cell.solved? }
  end

  def inspect
    rows.each { |row| puts row.map(&:value).join(' ') }
  end

  def to_s
    cells.map {|cell| cell.value}.join
  end
end