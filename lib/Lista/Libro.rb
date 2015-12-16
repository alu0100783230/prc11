require './lib/Lista/Bibliografia.rb'
module Listaa
    class Libro < Bibliografia
        attr_reader :ISBN
        def initialize(nombre,&block) super(nombre)
            @Tipo = "Libro"
            @ISBN = []
            
            instance_eval &block 
        end
        
        def add_ISBN(fech,num) 
            @ISBN << [fech,num]
        end
        
        def to_s 
            f = autorTo_s+"("+@Fecha_Publication.to_s+"). "+@Title+" ("+@Edicion.to_s+"). "+@Editorial
        end
        
        def isbn(isbn)
            @ISBN = isbn
        end
    end 
end