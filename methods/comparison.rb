module Methods
  module Comparison
    def ==(other)
      return false unless same_class?(other)
      (other.keys + keys).uniq.each do |k|
        return false if self[k] != other[k]
      end
      true
    end
    
    def >(other)
      return false unless same_class?(other)
      other.all?{|key,value|keys.include?(key) && self[key]==value}
    end
    
    def <(other)
      return false unless same_class?(other)
      all?{|key,value|other.keys.include?(key) && other[key]==value}
    end
    
    def >=(other)
      self > other || self == other
    end
    
    def <=(other)
      self < other || self == other
    end
    
    def !=(other)
      !(self == other)
    end

    private

    def same_class?(other)
      other.is_a?(FakeHash) || other.is_a?(Hash)
    end
  end
end