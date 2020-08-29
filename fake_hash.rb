class FakeHash
  attr_reader :keys

  def initialize(default=nil, &block)
    @keys = []
    if block_given?
      @default = block
    else
      @default = default
    end
  end

  def [](key)
    return inst_get(key) if keys.include? key
    if @default.is_a? Proc
      self[key] = @default.call
    elsif @default != nil
      self[key] = @default
    else
      inst_get(key)
    end
  end

  def []=(key, value)
    keys << key unless keys.include? key
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