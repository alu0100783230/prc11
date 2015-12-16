require './lib/Lista/Bibliografia.rb'

module Listaa
    class Revista < Bibliografia
        attr_accessor :impacto, :ISSN
        def initialize(nombre = "",&block) super(nombre)
            @Tipo = "Revista"
            @impacto = 0
            @ISSN = 00000000
            
            instance_eval &block 
        end
        
        def add_ISSN(num)
            @ISSN = num
        end
        
        def titleTo_s
            f = @Title.split
            j = ""
            f.collect{|x| if(x.size>3) 
                            j=j+x.capitalize+" "
                          else
                            j=j+x+" "
                          end
            }
            j
        end
        
        def to_s 
            f = autorTo_s+"("+@Fecha_Publication.to_s+"). "+titleTo_s+"("+@Edicion.to_s+"). "+@Editorial
        end
    end
end