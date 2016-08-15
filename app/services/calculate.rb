class Calculate

  attr_accessor :first_operand, :second_operand

  def initialize(first_operand, second_operand)
    self.first_operand = first_operand.to_i
    self.second_operand = second_operand.to_i
  end

  def add
    first_operand + second_operand
  end

  def subtract
    first_operand - second_operand
  end

  def multiply
    first_operand * second_operand
  end

  def divide
    first_operand / second_operand
  end

end