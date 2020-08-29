require '../fake_hash'
RSpec.describe FakeHash do
  
  before :each do
    @hash = FakeHash.new
  end

  context 'standard methods' do
    it 'method store' do
      @hash.store(1,'one')
      @hash.store(2,'two')
      expect(@hash[1]).to eq 'one'
      expect(@hash[2]).to eq 'two'
    end
  end
end