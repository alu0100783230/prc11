#! encoding UTF-8

require 'spec_helper'
require './lib/Lista.rb'

describe Listaa do
  before :all do
    
    
  end
  
  describe "Comprobar Lenguaje de Dominio Específico" do
    before :each do
      @bibligrafia_1 = Listaa::Bibliografia.new("Dune") do
          autor "Herbert", "Frank"
          editorial "DeBolsillo"
          isbn ""
          fecha "01-ENE-1991"
          edicion "1"
      end
    end
    
    it "Título" do
      expect(@bibligrafia_1.Title).to eq("Dune")
    end
    it "Autor" do
      expect(@bibligrafia_1.Author[0]).to eq("Frank Herbert")
    end
    
    it "To APA" do
      expect(@bibligrafia_1.APA).to eq("Herbert, F. (1991). Dune. DeBolsillo")
    end
  end
  
  
end
