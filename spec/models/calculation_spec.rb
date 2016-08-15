require 'rails_helper'

RSpec.describe Calculation, type: :model do
	context "operator can't be nill" do
		it "operator should have value" do
		  calculate = Calculation.create(:operator => "")
		  calculate.valid?
		  calculate.errors.should have_key(:operator)
		end
  end

  context "operand_one can't be nill" do
		it "operand_one should have value" do
		  calculate = Calculation.create(:operand_one => "")
		  calculate.valid?
		  calculate.errors.should have_key(:operand_one)
		end
  end

  context "operand_two can't be nill" do
		it "operand_two should have value" do
		  calculate = Calculation.create(:operand_two => "")
		  calculate.valid?
		  calculate.errors.should have_key(:operand_two)
		end
  end

  context "operands must be between 1 to 100" do
		it "operand_two should have value" do
		  calculate = Calculation.new(:operand_two => 5, :operand_one => 44)
		  calculate.operand_one.should satisfy { |v| v <= 100 }
		  calculate.operand_one.should satisfy { |v| v > 0 }
		  calculate.operand_two.should satisfy { |v| v <= 100 }
		  calculate.operand_one.should satisfy { |v| v > 0 }
		end
  end

  context "should set result" do
    it "result should be set" do
    	calculation = Calculation.new(:operand_two => 5, :operand_one => 44, :operator => '+')
      calculation.should_receive(:calculate_result)
      calculation.save
    end
  end

  context "call count should update" do
    it "call count should increment" do
    	calculation = Calculation.new(:operand_two => 5, :operand_one => 44, :operator => '+')
      calculation.should_receive(:update_call_counter)
      calculation.save
    end
  end

  context "results calculation" do
    it "result should be sum" do
    	calculation = Calculation.new(:operand_two => 5, :operand_one => 44, :operator => '+')
      result = calculation.calculate_result
      expect(result).to eq 49
    end
  end

end
