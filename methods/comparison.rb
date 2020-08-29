module Methods
  module Comparison
    def ==(other)
      return false unless same_class?(other)
      other.each do |key, value|
        return false if self[key] != value
      end
      each do |key, value|
        return false if other[key] != value
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