module Methods
  module Standard
    def clear
      keys.each do |key|
        inst_del(key)
      end
      keys.clear
      self
    end

    def delete(key)
      keys.delete(key)
      inst_del(key)
    end
  end
end