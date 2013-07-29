class ChangeTypeForResult < ActiveRecord::Migration
  def change
    change_table :number_calculators do |t|
      t.remove :result
    end

    add_column :number_calculators, :result, :string
  end
end
