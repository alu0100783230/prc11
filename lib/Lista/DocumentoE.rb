require './lib/Lista/Bibliografia.rb'

module Listaa
    class DocumentoE < Bibliografia
        def initialize(nombre = "",&block) super(nombre)
            @Tipo = "DocumentoE"  
            
            instance_eval &block 
        end
        
        def to_s 
            f = autorTo_s+"("+@Fecha_Publication.to_s+"). "+@Title+" ("+@Edicion.to_s+"). "+@Editorial
        end
    end
end