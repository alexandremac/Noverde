require 'database'

describe Database do
  context 'test collection' do
    it 'check size' do
      csv = Database.new('contas.csv')
      expect(csv.collection.size).to be > 0
    end
  end
end
