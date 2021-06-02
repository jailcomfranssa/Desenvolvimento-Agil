require 'rails_helper' 
RSpec.describe Categ, :type => :model do
    it "Categoria nao informada" do
        categ = Categ.new
        expect( categ.valid? ).to be_falsey  
    end
end