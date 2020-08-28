class FakeHash
  attr_reader :keys
  def initialize
    @keys = []
  end
  def [](key)
    inst_get(key)
  end
  def []=(key, value)
    keys << key
    inst_set(key, value)
  end
  def to_s
    str = '{'
    keys.each_with_index do |key, index|
      str += key.inspect + '=' + inst_get(key).inspect
      if index < keys.length - 1
        str += ', '
      end
    end
    str += '}'
    return str
  end
  def inspect
    to_s
  end
  private
  def trans_key(key)
    "@_#{key.class}_#{key}"
  end
  def inst_set(key, value)
    instance_variable_set(trans_key(key), value)
  end
  def inst_get(key)
    instance_variable_get(trans_key(key))
  end
end