class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.date :date
      t.string :description
      t.decimal :amount
      t.boolean :approved

      t.timestamps
    end
  end
end
