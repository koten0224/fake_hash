module Methods
  module Definers

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
end