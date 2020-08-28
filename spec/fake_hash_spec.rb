require '../fake_hash'
RSpec.describe FakeHash do
  before :each do
    @hash = FakeHash.new
  end
  it 'initialize test' do
    expect(@hash).to be_is_a FakeHash
    _private_methods = %i(
      trans_key
      inst_set
      inst_get
    )
    _private_methods.each do |m|
      expect(@hash.private_methods).to be_include m
    end
    expect(@hash.inspect).to eq '{}'
    # expect()
  end

  it 'implement value' do
    @hash[1] = 2
    @hash['1'] = 5
    expect(@hash[1]).to eq 2
    expect(@hash['1']).to eq 5
    @hash['a'] = 'ruby'
    @hash[:a] = 'rails'
    expect(@hash['a']).to eq 'ruby'
    expect(@hash[:a]).to eq 'rails'
    expect(@hash.inspect).to eq '{1=2, "1"=5, "a"="ruby", :a="rails"}'
  end

end