require 'cell'

describe Cell do
  let(:cell)  {Cell.new(1)}
  let(:empty_cell)  {Cell.new(0)}

  it 'should contain a value' do
    expect(cell).to respond_to(:value)
    expect(cell.value).to eq 1
  end
  
  it 'should be solved if value is not zero' do
    expect(cell).to be_solved
  end

  it 'should not be solved if value is zero' do
    expect(empty_cell).not_to be_solved
  end

  it 'changes status when solved' do
    empty_cell.solve
    expect(empty_cell).to be_solved
  end


end