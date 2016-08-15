require 'rails_helper'

RSpec.describe Calculate, type: :service do
	calculation = Calculate.new(20,10)
	context "adding two numbers" do
    it "returns the sum value" do
      sum = calculation.add
      expect(sum).to eq 30
    end
  end

  context "subtract two numbers" do
    it "returns the difference value" do
      difference = calculation.subtract
      expect(difference).to eq 10
    end
  end

  context "multiply two numbers" do
    it "returns the multiplication value" do
      multiplication = calculation.multiply
      expect(multiplication).to eq 200
    end
  end
  
  context "division of two numbers" do
    it "returns the division value" do
      division = calculation.divide
      expect(division).to eq 2
    end
  end
end