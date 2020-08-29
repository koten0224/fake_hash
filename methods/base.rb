require './methods/comparison'
require './methods/definers'
require './methods/implementation'
require './methods/iteration'
require './methods/standard'
require './methods/style'
module Methods
  module Base
    def self.included(base)
      base.include Comparison
      base.include Definers
      base.include Implementation
      base.include Iteration
      base.include Standard
      base.include Style
    end
  end
end