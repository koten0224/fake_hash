require './methods/definers'
require './methods/style'
require './methods/implementation'
module Methods
  module Base
    def self.included(base)
      base.include Definers
      base.include Implementation
      base.include Style
    end
  end
end