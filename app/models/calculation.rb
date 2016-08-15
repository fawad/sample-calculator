class Calculation < ApplicationRecord
	validates :operator, :operand_one, :operand_two, presence: true
	validate :check_operands, :handle_divide_by_zero

	before_create :calculate_result
	before_save :update_call_counter


	def check_operands
		if self.operand_one.present? && self.operand_two.present?
			if self.operand_one < 0 || self.operand_one > 99
				errors.add(:operand_one, "must be between 0 to 99")
			elsif self.operand_two < 0 || self.operand_two > 99
				errors.add(:operand_two, "must be between 0 to 99")
			end
		else
			errors.add(:both_operands, "must be between 0 to 99")
		end		
	end

	def handle_divide_by_zero
		if self.operand_two == 0 && self.operator == '/'
			errors.add(:operand_two, "cannot be 0 for division")
		end
	end

	def calculate_result
		for_calculation = Calculate.new(self.operand_one,self.operand_two)
		case self.operator
		when "+"
		  self.result = for_calculation.add
		when "*"
		  self.result = for_calculation.multiply
		when "-"
		  self.result = for_calculation.subtract
		when "/"
			self.result = for_calculation.divide
		else
			0
		end
	end

	def update_call_counter
		self.calls_count = self.calls_count+1
	end

end
