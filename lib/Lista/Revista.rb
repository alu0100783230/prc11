require './lib/Lista/Bibliografia.rb'

module Listaa
    class Revista < Bibliografia
        attr_accessor :impacto, :ISSN
        def initialize
            @Tipo = "Revista"
            @impacto = 0
            @ISSN = 00000000
        end
        
        def add_ISSN(num)
            @ISSN = num
        end
    end
end