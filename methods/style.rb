module Methods
  module Style
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
  end
end