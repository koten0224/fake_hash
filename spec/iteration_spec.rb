require '../fake_hash'
RSpec.describe FakeHash do
  
  before :each do
    @hash = FakeHash.new
    (1..9).each do |n|
      @hash[n] = n ** 2
    end
  end

  context 'iteration' do
    it 'each' do
      expect(@hash.each).to be_is_a Enumerator
      @hash.each do |k, v|
        expect(v).to eq k ** 2
      end
    end

    it 'each_key' do
      expect(@hash.each_key).to be_is_a Enumerator
      expect(@hash.each_key.to_a).to eq (1..9).to_a
    end

    it 'each_value' do
      expect(@hash.each_value).to be_is_a Enumerator
      expect(@hash.each_value.to_a).to eq (1..9).map{|x|x**2}
    end

    it 'map' do
      expect(@hash.map).to be_is_a Enumerator
      expect(@hash.map{|k,v|k**2}).to eq @hash.each_value.to_a
    end

    it 'all?' do
      expect(@hash.all?).to be true
      expect(@hash.all?{|k,v|v<100}).to be true
      expect(@hash.all?{|k,v|v<80}).to be false
    end
  end
end