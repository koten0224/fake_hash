require '../fake_hash'
RSpec.describe FakeHash do
  
  before :each do
    @hash = FakeHash.new
    (1..9).each do |n|
      @hash[n] = n ** 2
    end
  end

  context 'standard methods' do
    it 'store' do
      @hash.store(1,'one')
      @hash.store(2,'two')
      expect(@hash[1]).to eq 'one'
      expect(@hash[2]).to eq 'two'
    end

    it 'delete' do
      @hash.delete(9)
      expect(@hash[9]).to eq nil
      expect(@hash[8]).to eq 64
      @hash.delete(7)
      expect(@hash[7]).to eq nil
      expect(@hash.inspect).to eq '{1=1, 2=4, 3=9, 4=16, 5=25, 6=36, 8=64}'
    end

    it 'clear' do
      (1..9).each do |n|
        expect(@hash[n]).to eq n ** 2
      end
      @hash.clear
      (1..9).each do |n|
        expect(@hash[n]).to eq nil
      end
      expect(@hash.inspect).to eq '{}'
    end
  end
end