module Listaa
    class Autor
        attr_reader :nombre,:apellido 
        def initialize(nombre,apellido)
            @nombre = nombre
            @apellido = apellido
        end
        def to_s ()
            f=""
            @apellido.collect { |x| f=f+x.to_s+" "}
            f=f+", "
            @nombre.collect { |x| f=f+x[0]+". "}
            f
        end
    end
end