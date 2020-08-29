require './methods/base'
class FakeHash
  include Methods::Base
  attr_reader :keys

  def initialize(default=nil, &block)
    @keys = []
    if block_given?
      @default = block
    else
      @default = default
    end
  end
end