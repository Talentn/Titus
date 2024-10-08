class RemoveNameFromExpenses < ActiveRecord::Migration[7.2]
  def change
    remove_column :expenses, :name, :string
  end
end
