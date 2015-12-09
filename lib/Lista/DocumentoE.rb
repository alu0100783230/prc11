require './lib/Lista/Bibliografia.rb'

module Listaa
    class DocumentoE < Bibliografia
        def initialize
            @Tipo = "DocumentoE"  
        end
        
        def to_s 
            f = autorTo_s+"("+@Fecha_Publication.to_s+"). "+@Title+" ("+@Edicion.to_s+"). "+@Editorial
        end
    end
end