class NumberCalculatorsController < ApplicationController

  def new
    self.refresh
  end

  def convert
    if params[:commit] == 'Refresh'
      self.refresh
      return render :action => "new"
    end
    if NumberCalculator.exists?(params[:id])
      @number_calculator = NumberCalculator.find(params[:id])
      if !@number_calculator.update_attributes(number_calculator_params)
        return render :action => "new"
      end
    else
      @number_calculator = NumberCalculator.new(number_calculator_params)
    end
    if @number_calculator.save
      @number_calculator.calculate
      @number_calculator.save
      return redirect_to @number_calculator
    else
      return render :action => "new"
    end
  end

  def show
    @number_calculator = NumberCalculator.find(params[:id])
  end

protected
  def number_calculator_params
    params.require(:number_calculator).permit(:base, :number, :base_ten_number)
  end

  def refresh
    NumberCalculator.all.delete_all
    @number_calculator = NumberCalculator.new
  end

end
