module Listaa

Nodo = Struct.new(:value, :next, :prev)

class Lista 
    include Enumerable
    attr_reader :First, :Sz
    def initialize
        @First = nil
        @Sz = 0
    end
    
    def push_back(objeto)
        if(@Sz==0)
            @First = Nodo.new(objeto,nil,nil)
            @Last = @First
        else
            @Last.next = Nodo.new(objeto,nil,@Last)
            @Last = @Last.next
        end
        @Sz = @Sz + 1
    end
    
    def at(i)
        @Aux = @First
        if(i<@Sz)
            for j in 1..i do
                @Aux = @Aux.next
            end
            @Aux.value
        else
            nil
        end
    end
    
    def takeAt(i)
        @Aux = @First
        if(i<@Sz)
            for j in 1..i-1 do
                @Aux = @Aux.next
            end
            @Aux2 = @Aux.next
            @Aux.next = @Aux2.next
            @Sz = @Sz -1
            @Aux2.value
        else
            nil
        end
    end
    
    def takeFirst
        if(@Sz>=1)
            @Aux = @First
            @First = @First.next
            @Sz = @Sz -1
            @Aux.value
        else
            nil
        end
    end
    
    def iterarFirst(num)
        if(num<@Sz)
            aux = @First
            for i in 0..num-1 do
                aux = aux.next
            end
            aux.value
        else
            nil
        end
    end
    
    def iterarLast(num)
        if(num<@Sz)
            aux = @Last
            for i in 0..num-1 do
                aux = aux.prev
            end
            aux.value
        else
            nil
        end
    end
    
    def each
        aux = @First
        while aux!=nil
            yield aux.value
            aux = aux.next
        end
    end
    
    def to_s 
        a = []
        a = sort { |x,y| x <=> y }
        
        f=""
        a.collect{ |x| f=f+x.autorTo_s+"\n"}
        f
    end
    
    def to_apa
        a = []
        a = sort { |x,y| x <=> y }
        
        f=""
        a.collect{ |x| f=f+x.to_s+"\n"}
        f
    end
end

end