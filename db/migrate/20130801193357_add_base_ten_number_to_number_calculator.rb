class AddBaseTenNumberToNumberCalculator < ActiveRecord::Migration
  def change
    remove_column :number_calculators, :result
    add_column :number_calculators, :base_ten_number, :string
  end
end
