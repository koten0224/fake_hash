require '../fake_hash'
RSpec.describe FakeHash do
  
  before :each do
    @hash_a = FakeHash.new
    @hash_b = FakeHash.new
    @hash_c = FakeHash.new
    %i(a b c).each do |k|
      @hash_a[k] = 1
      @hash_b[k] = 1
      @hash_c[k] = 1
    end
    @hash_a[:d] = 1
  end

  context 'comparison' do
    it 'equal' do
      expect(@hash_b).to eq @hash_c
      expect(@hash_a).not_to eq @hash_c
      expect(@hash_a).not_to eq 1
    end

    it 'greater than' do
      expect(@hash_a > @hash_b).to be true
      expect(@hash_b > @hash_a).to be false 
    end

    it 'less than' do
      expect(@hash_a < @hash_b).to be false
      expect(@hash_b < @hash_a).to be true
    end

    it 'greater or equal than' do
      expect(@hash_a >= @hash_b).to be true
      expect(@hash_a >= @hash_c).to be true
      expect(@hash_b >= @hash_a).to be false
    end

    it 'less or equal than' do
      expect(@hash_a <= @hash_b).to be false
      expect(@hash_a <= @hash_c).to be false
      expect(@hash_b <= @hash_a).to be true
    end
  end
end