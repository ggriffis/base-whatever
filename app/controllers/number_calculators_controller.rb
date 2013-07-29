class NumberCalculatorsController < ApplicationController

  def new
    @number_calculator = NumberCalculator.new
  end

  def create
    @number_calculator = NumberCalculator.new(number_calculator_params)
    @number_calculator.calculate
    if @number_calculator.save
      redirect_to @number_calculator
    else
      flash[:alert] = "Parameters were invalid. Please enter again"
      render :action => "new"
    end
  end

  def show
    @number_calculator = NumberCalculator.find(params[:id])
  end

private
  def number_calculator_params
    params.require(:number_calculator).permit(:base, :number)
  end
end
