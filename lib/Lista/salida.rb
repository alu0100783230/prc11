require_relative 'Bibliografia.rb'
require_relative 'Lista.rb'

a = Bibliografia.new
b = Bibliografia.new
c = Bibliografia.new
d = Bibliografia.new
e = Bibliografia.new

a.add_author("Dave Thomas")
a.add_author("Andy Hunt")
a.add_author("Chad Fowler")
b.add_author("Scott Chacon")
c.add_author("David Flanagan")
c.add_author("Yukihiro Matsumoto")
d.add_author("David Chelimsky")
d.add_author("Dave Astels")
d.add_author("Bryan Helmkamp")
d.add_author("Dan North")
d.add_author("Zach Dennis")
d.add_author("Aslak Hellesoy")
e.add_author("Richard E. Silverman")

a.add_title("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby)")
b.add_title("Pro Git 2009th Edition. (Pro)")
c.add_title("The Ruby Programming Language")
d.add_title("The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends ")
e.add_title("Git Pocket Guide")

a.add_editorial("Pragmatic Bookshelf")
b.add_editorial("Apress")
c.add_editorial("O’Reilly Media")
d.add_editorial("Pragmatic Bookshelf")
e.add_editorial("O’Reilly Media")

a.add_serie("(The Facets of Ruby)")
b.add_serie("(Pro)")
d.add_serie("(The Facets of Ruby)")

a.set_edicion(4)
b.set_edicion(2009)
c.set_edicion(1)
d.set_edicion(1)
e.set_edicion(1)

a.set_publication("July 7, 2013")
b.set_publication("August 27, 2009")
c.set_publication("February 4, 2008")
d.set_publication("December 25, 2010")
e.set_edicion("August 2, 2013")

a.add_ISBN([13,"978-1937785499"])
a.add_ISBN([10,1937785491])
b.add_ISBN([13,"978-1430218333"])
b.add_ISBN([10,1430218339])
c.add_ISBN([10,"0596516177"])
c.add_ISBN([13,"978-0596516178"])
d.add_ISBN([10,1934356379])
d.add_ISBN([13,"978-1934356371"])
e.add_ISBN([10,1449325866])
e.add_ISBN([13,"978-1449325862"])

m = [a, b, c, d, e]
l = Lista.new

for i in 0..4 do
    l.push_back(m[i])
end

for i in 0..4 do
    puts l.takeFirst.get_formato
    puts "\n"
end
