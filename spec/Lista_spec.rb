require 'spec_helper'
require './lib/Lista/Bibliografia.rb'
require './lib/Lista/Lista.rb'
require './lib/Lista/DocumentoE.rb'
require './lib/Lista/Revista.rb'
require './lib/Lista/Libro.rb'

describe Lista do
  before :all do
    @l = Lista.new
    @a = Revista.new
    @a.add_title("Nature")
    @b = Libro.new
    @b.add_title("Frankenstein o el moderno Prometeo")
    @c = DocumentoE.new
    @c.add_title("B.O.E.")
  end
  
  describe "Comprobar tipo" do
    it "Libro" do
      expect(@b.get_tipo).to eq("Libro")
      expect(@b.is_a?Bibliografia).to eq true
    end
    
    it "Revista" do
      expect(@a.get_tipo).to eq("Revista")
      expect(@a.is_a?Bibliografia).to eq true
    end
    
    it "DocumentoE" do
      expect(@c.get_tipo).to eq("DocumentoE")
      expect(@c.is_a?Bibliografia).to eq true
    end
  end
  
  context "Comprobar especificaciones propias" do
    it "Índice de impacto de una revista" do
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
end
