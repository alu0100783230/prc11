require './lib/Lista/Bibliografia.rb'
module Listaa
    class Libro < Bibliografia
        attr_reader :ISBN
        def initialize
            @Tipo = "Libro"
            @ISBN = []
        end
        
        def add_ISBN(fech,num) 
            @ISBN << [fech,num]
        end
        
        def to_s 
            f = autorTo_s+"("+@Fecha_Publication.to_s+"). "+@Title+" ("+@Edicion.to_s+"). "+@Editorial
        end
    end 
end