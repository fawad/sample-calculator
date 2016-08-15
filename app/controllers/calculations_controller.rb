class CalculationsController < ApplicationController
  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.find_or_initialize_by(calculation_params)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def calculation_params
      params.require(:calculation).permit(:operand_one, :operand_two, :operator, :result, :calls_count)
    end
end
