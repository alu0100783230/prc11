# coding: utf-8

require 'spec_helper'
require './lib/Lista.rb'

describe Listaa do
  describe "Comprobar Lenguaje de Dominio Específico" do
    before :each do
      @bibligrafia_1 = Listaa::Libro.new("Dune") do
          autor "Herbert","Frank"
          autor "Coautor","Nombre"
          editorial "DeBolsillo"
          fecha "1991"
          edicion "1"
          isbn "10","123456789"
      end
      @bibligrafia_2 = Listaa::Libro.new("Fundacion") do
          autor "Asimov","Isaac"
          editorial "DeBolsillo"
          fecha "1981"
          edicion "1"
          isbn "11","1288789"
      end
      @lista = Listaa::Lista.new
      @lista.push_back(@bibligrafia_1)
      @lista.push_back(@bibligrafia_2)
    end
    
    it "Título" do
      expect(@bibligrafia_1.Title).to eq("Dune")
    end
    
    it "Autor" do
      expect(@bibligrafia_1.autorTo_s).to eq("Herbert , F.  & Coautor , N.  & ")
    end
    
    it "APA" do
      expect(@bibligrafia_1.to_s).to eq("Herbert , F.  & Coautor , N.  & "+
                                        "(1991). Dune (1). DeBolsillo")
    end
    
    it "Lista" do
      expect(@lista.to_apa).to eq("Asimov , I. (1981). Fundacion (1). DeBolsillo\n"+
                                  "Herbert , F.  & Coautor , N.  & (1991). Dune (1). DeBolsillo\n")
    end
  end
end

describe Listaa do
  before :all do
    @l = Listaa::Lista.new
    @l1 = Listaa::Lista.new
    @l3 = Listaa::Lista.new
    @a = Listaa::Revista.new("Nature") do
    end
    @b = Listaa::Libro.new("Frankenstein o el moderno Prometeo") do
    end
    @c = Listaa::DocumentoE.new("B.O.E.") do
    end
    @l.push_back(@a)
    @l.push_back(@b)
    @l.push_back(@c)
    @n1 = Listaa::Autor.new(["Wernher","Magnus","Maximilian"],["Freiherr","Von Braun"])
    @b1 = Listaa::Bibliografia.new
    @b2 = Listaa::Bibliografia.new
    @b3 = Listaa::Bibliografia.new
    @b4 = Listaa::Bibliografia.new
    @b5 = Listaa::Bibliografia.new
    @b5.add_author(["Daniel"],["Darias","Sánchez"])
    @b5.add_author(["Rudolf"],["Cicko"])
    @b1.add_author(["Wernher","Magnus","Maximilian"],["Freiherr","Von Braun"])
    @b1.set_publication("26-AGO-15")
    @b4.add_author(["Wernher","Magnus","Maximilian"],["Freiherr","Von Braun"])
    @b4.set_publication("27-AGO-15")
    @b2.add_author(["Serguéi"],["Pávlovich","Koroliov"])
    @b3.add_author(["Jean-Jacques"],["Dordain"])
    @l1.push_back(@b2)
    @l1.push_back(@b1)
    @l1.push_back(@b3)
    @l1.push_back(@b4)
    @l3 = Listaa::Lista.new
    #Expetativa de Libro
    @b.add_author(["Mary"],["Shelley"])
    @b.add_ISBN(10,4465448)
    @b.add_editorial("Ediciones B")
    @b.add_serie("Ciencia Ficción")
    @b.set_edicion(15)
    @b.set_publication(2015)
    #Expetativa de Documento Electrónico
    @w = Listaa::DocumentoE.new("Práctica de laboratorio #10")do
    end
    @w.add_author(["Coromoto"],["León","Hernández"])
    @w.add_editorial("ULL")
    @w.add_serie("LPP")
    @w.set_edicion(10)
    @w.set_publication(2015)
    #Expetativa de Revista
    @m = Listaa::Revista.new("La revista más necesaria para la vida diaria") do
    end
    @m.add_author(["Eleazar"],["Díaz","Delgado"])
    @m.add_editorial("Ediciones Ele")
    @m.add_serie("SERIE")
    @m.set_edicion(2)
    @m.set_publication(2013)
    
    @l3.push_back(@w)
    @l3.push_back(@m)
    @l3.push_back(@b)
  end
  
  describe "Comprobar autor" do
    it "nombre" do
      expect(@n1.nombre).to eq(["Wernher","Magnus","Maximilian"])
    end
    it "apellido" do
      expect(@n1.apellido).to eq(["Freiherr","Von Braun"])
    end
    it "orden" do
      expect(@n1.to_s).to eq("Freiherr Von Braun , W. M. M. ")
    end
    it "&" do
      expect(@b5.autorTo_s).to eq("Darias Sánchez , D.  & Cicko , R.  & ")
    end
    it "orden bibliografico" do
      expect(@b1.Author[0].to_s).to eq("Freiherr Von Braun , W. M. M. ")
    end
  end
  
  describe "Orden de la lista" do
    #a pesar de haber introducido las referencias al revés deben ordenarse
    it "Primero Von Braun" do
      expect(@l1.to_s).to eq("Dordain , J. \n"+
                            "Freiherr Von Braun , W. M. M. \n"+
                            "Freiherr Von Braun , W. M. M. \n"+
                            "Pávlovich Koroliov , S. \n")
    end
    it "Desenpate" do
      @l2 = @l1.sort
      expect(@l2.at(1).Fecha_Publication).to eq("27-AGO-15")
      expect(@l2.at(2).Fecha_Publication).to eq("26-AGO-15")
    end
  end
  
  describe "Referencia completa" do
    it "Libro" do
      expect(@b.to_s).to eq("Shelley , M. (2015). Frankenstein o el moderno Prometeo "+
                            "(15). Ediciones B")
    end
    it "Documento Electrónico" do
      expect(@w.to_s).to eq("León Hernández , C. (2015). Práctica de laboratorio #10 "+
                            "(10). ULL")
    end
    it "Revista" do
      expect(@m.to_s).to eq("Díaz Delgado , E. (2013). La Revista más Necesaria Para la Vida Diaria "+
                            "(2). Ediciones Ele")
    end
  end
  
  describe "Comprobar tipo" do
    it "Libro" do
      expect(@b.get_tipo).to eq("Libro")
      expect(@b.is_a?Listaa::Bibliografia).to eq true
    end
    
    it "Revista" do
      expect(@a.get_tipo).to eq("Revista")
      expect(@a.is_a?Listaa::Bibliografia).to eq true
    end
    
    it "DocumentoE" do
      expect(@c.get_tipo).to eq("DocumentoE")
      expect(@c.is_a?Listaa::Bibliografia).to eq true
    end
  end
  
  describe "Comprobar Lista entera" do
    it "Tamaño" do
      expect(@l3.count).to eq(3)
    end
    it "APA" do
      expect(@l3.to_apa).to eq("Díaz Delgado , E. (2013). La Revista más Necesaria Para la Vida Diaria (2). Ediciones Ele\n"+
                                "León Hernández , C. (2015). Práctica de laboratorio #10 (10). ULL\n"+
                               "Shelley , M. (2015). Frankenstein o el moderno Prometeo (15). Ediciones B\n")
    end
  end
  
  context "Comprobar especificaciones propias" do
    it "Indice de impacto de una revista" do
      @a.impacto = 29.27
      expect(@a.impacto).to eq(29.27)
    end
    
    it "ISBN de un libro" do
      @b.add_ISBN(13,9846546)
      expect(@b.ISBN).to eq([[10,4465448],[13,9846546]])
    end
    
    it "ISSN de una revista" do
      @a.add_ISSN(6146816)
      expect(@a.ISSN).to eq(6146816)
    end
  end
  
end