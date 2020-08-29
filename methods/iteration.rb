module Methods
  module Iteration
    def each_key(&block)
      iter(keys, &block)
    end

    def each_value(&block)
      body = keys.map{|k|inst_get(k)}
      iter(body, &block)
    end

    def each(&block)
      body = keys.map do |k|
        [k,inst_get(k)]
      end
      iter(body, &block)
    end

    def map(&block)
      each.map(&block)
    end

    def all?(&block)
      if block_given?
        map(&block).all?
      else
        true
      end
    end

    private

    def iter(body, &block)
      if block_given?
        body.each(&block)
        self
      else
        body.each
      end
    end
  end
end