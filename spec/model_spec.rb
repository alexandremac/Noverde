require 'model'

describe Model do
  context 'test amount' do
    it 'check add positive' do
      item = Model.new(1, 10)
      item.add(10)
      expect(item.value).to eql(20)
    end
    it 'check add negative' do
      item = Model.new(1, 10)
      item.add(-20,5)
      expect(item.value).to eql(-15)
    end

  end
end
