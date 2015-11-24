require './lib/Lista/Bibliografia.rb'

class Libro < Bibliografia
    attr_reader :ISBN
    def initialize
        @Tipo = "Libro"
        @ISBN = []
    end
    
    def add_ISBN(fech,num) 
        @ISBN << [fech,num]
    end
end 