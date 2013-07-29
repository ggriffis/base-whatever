class CreateNumberCalculators < ActiveRecord::Migration
  def change
    create_table :number_calculators do |t|
      t.string :number
      t.integer :base
      t.integer :result
    end
  end
end
