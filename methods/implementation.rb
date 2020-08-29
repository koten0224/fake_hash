module Methods
  module Implementation
    def self.included(base)
      base.class_eval do
        alias_method :store, :[]=
      end
    end
    
    def [](key)
      return inst_get(key) if keys.include? key
      if @default.is_a? Proc
        self[key] = @default.call
      elsif @default != nil
        self[key] = @default
      end
    end

    def []=(key, value)
      keys << key unless keys.include? key
      inst_set(key, value)
    end
  end
end