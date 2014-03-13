class Cell
  attr_accessor :value, :neighbours


  def initialize(val)
    @value = val
    @solved = value != 0
    @candidates = []
    @neighbours = [] # array of cells
  end

  def solve
    if candidates.size == 1
      @value = candidates[0] 
      @solved = true
    end
  end

  def solved?
    @solved 
  end

  def candidates
    (1..9).to_a - neighbours
  end

end