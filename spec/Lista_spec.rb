#! encoding UTF-8

require 'spec_helper'
require './lib/Lista.rb'

describe Listaa do
  before :all do
    
    
  end
  
  describe "Comprobar Lenguaje de Dominio Específico" do
    before :each do
      @bibligrafia_1 = Listaa::Bibliografia.new("Dune") do
          autor ["Herbert"],["Frank"]
          editorial "DeBolsillo"
          fecha "01-ENE-1991"
          edicion "1"
      end
    end
    
    it "Título" do
      expect(@bibligrafia_1.Title).to eq("Dune")
    end
    it "Autor" do
      expect(@bibligrafia_1.Author[0].to_s).to eq("Herbert , F. ")
    end
    it "APA" do
      expect(@bibligrafia_1.get_formato).to eq("Herbert , F. \nDune\n; 1 edition (01-ENE-1991)\n")
    end
  end
  
  
end
