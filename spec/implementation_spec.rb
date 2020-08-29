require '../fake_hash'
RSpec.describe FakeHash do
  
  before :each do
    @hash = FakeHash.new
  end

  context 'implementation' do
    
    it 'initialize test' do
      expect(@hash).to be_is_a FakeHash
      _private_methods = %i(
        trans_key
        inst_set
        inst_get
        inst_del
        same_class?
        iter
      )
      _private_methods.each do |m|
        expect(@hash.private_methods).to be_include m
      end
      expect(@hash.inspect).to eq '{}'
    end

    it 'implement value as different classes keys' do
      @hash[1] = 2
      @hash['1'] = 5
      expect(@hash[1]).to eq 2
      expect(@hash['1']).to eq 5
      @hash['a'] = 'ruby'
      @hash[:a] = 'rails'
      expect(@hash['a']).to eq 'ruby'
      expect(@hash[:a]).to eq 'rails'
      expect(@hash[:b]).to eq nil
      expect(@hash.inspect).to eq '{1=2, "1"=5, "a"="ruby", :a="rails"}'
    end

    it 'modify value when key exist' do
      @hash[1] = 22
      @hash[1] = 33
      expect(@hash[1]).to eq 33
      expect(@hash.inspect).to eq '{1=33}'
    end

    it 'has default value as string' do
      @hash = FakeHash.new('oo')
      expect(@hash['whatever']).to eq 'oo'
      expect(@hash.inspect).to eq '{"whatever"="oo"}'
    end
    
    
    it 'has default value as false' do
      @hash = FakeHash.new(false)
      expect(@hash['whatever']).to eq false
      expect(@hash.inspect).to eq '{"whatever"=false}'
    end

    it 'has default value as block' do
      @hash = FakeHash.new do
        FakeHash.new
      end
      expect(@hash['whatever'].inspect).to eq '{}'
      expect(@hash.inspect).to eq '{"whatever"={}}'
    end
  end
end