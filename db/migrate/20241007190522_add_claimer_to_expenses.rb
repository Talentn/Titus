class AddClaimerToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :claimer, :string
  end
end
