require 'grid'

describe Grid do
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:grid) { Grid.new(puzzle) }

  context 'initialize' do
    

    it 'should have 81 cells' do
      expect(grid.cells.size).to eq 81
    end

    it 'should have an unsolved first cell' do
      expect(grid.cells.first).not_to be_solved
    end

    it 'should have a solved second cell with value 1' do
      expect(grid.cells[1].value).to eq 1 
    end

    it 'knows when it is solved' do
      grid.cells.each {|cell| cell.solve}
      expect(grid).to be_solved
    end
  end

  context 'Rows, cols and squares' do
   
    it 'knows each row has 9 cells' do
      expect(grid.rows.first.size).to eq 9
    end

    it 'knows there are 9 rows' do
      expect(grid.rows.size).to eq 9
    end

    it 'knows first row' do
      expect(grid.rows.first[5].value).to eq 3
    end

    it 'knows each column has 9 cells' do
      expect(grid.cols.first.size).to eq 9
    end
    it 'knows there are 9 columns' do
      expect(grid.cols.size).to eq 9
    end
    it 'knows first column' do
      expect(grid.cols.first[3].value).to eq 4
    end

    it 'knows each box has 9 cells' do
      expect(grid.boxes.first.size).to eq 9
    end
    it 'knows there are 9 boxes' do
      expect(grid.boxes.size).to eq 9
    end
    it 'knows first box' do
      expect(grid.boxes.first[7].value).to eq 7
    end






  end 

end