#! encoding UTF-8

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
  end
end
