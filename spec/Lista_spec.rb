#! encoding UTF-8

require 'spec_helper'
require './lib/Lista.rb'

describe Listaa::Lista do
  before :all do
    @l = Listaa::Lista.new
    @l1 = Listaa::Lista.new
    @a = Listaa::Revista.new
    @a.add_title("Nature")
    @b = Listaa::Libro.new
    @b.add_title("Frankenstein o el moderno Prometeo")
    @c = Listaa::DocumentoE.new
    @c.add_title("B.O.E.")
    @l.push_back(@a)
    @l.push_back(@b)
    @l.push_back(@c)
    @n1 = Listaa::Autor.new(["Wernher","Magnus","Maximilian"],["Freiherr","Von Braun"])
    @b1 = Listaa::Bibliografia.new
    @b2 = Listaa::Bibliografia.new
    @b1.add_author(["Wernher","Magnus","Maximilian"],["Freiherr","Von Braun"])
    @b2.add_author(["Serguéi"],["Pávlovich","Koroliov"])
    @l1.push_back(@b2)
    @l1.push_back(@b1)
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
    it "orden bibliografico" do
      expect(@b1.Author[0].to_s).to eq("Freiherr Von Braun , W. M. M. ")
    end
  end
  
  describe "Orden de la lista" do
    #a pesar de haber introducido las referencias al revés deben ordenarse
    it "Primero Von Braun" do
      expect(@l1.to_s).to eq("Freiherr Von Braun , W. M. M. , Pávlovich Koroliov , S. , ")
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
  
  context "Comprobar especificaciones propias" do
    it "Indice de impacto de una revista" do
      @a.impacto = 29.27
      expect(@a.impacto).to eq(29.27)
    end
    
    it "ISBN de un libro" do
      @b.add_ISBN(10,4465448)
      @b.add_ISBN(13,9846546)
      expect(@b.ISBN).to eq([[10,4465448],[13,9846546]])
    end
    
    it "ISSN de una revista" do
      @a.add_ISSN(6146816)
      expect(@a.ISSN).to eq(6146816)
    end
  end
  
  describe "Comparar" do
    it "Nature > Frankenstein" do
      expect(@a>@b).to eq(true)
    end
    
    it "Nature > B.O.E." do
      expect(@a>@c).to eq(true)
    end
    
    it "B.O.E. < Frankenstein" do
      expect(@c<@b).to eq(true)
    end
    
    it "B.O.E. <=> Frankenstein = -1" do
      expect(@c<=>@b).to eq(-1)
    end
  end
  
  describe "Enumerar" do
    it "all?" do
      expect(@l.all?).to eq(true)
    end
    it "count" do
      expect(@l.count).to eq(3)
    end
    it "any?" do
      expect(@l.any?).to eq(true)
    end
    it "max" do
      expect(@l.max).to eq(@a)
    end
    it "min" do
      expect(@l.min).to eq(@c)
    end
    it "drop" do
      expect(@l.drop(0)).to eq([@a,@b,@c])
    end
    it "sort" do
      expect(@l.sort).to eq([@c,@b,@a])
    end
  end
end
