class CreateCalculations < ActiveRecord::Migration[5.0]
  def change
    create_table :calculations do |t|
      t.integer :operand_one
      t.integer :operand_two
      t.string :operator
      t.integer :calls_count, default: 0
      t.float :result

      t.timestamps
    end
  end
end
