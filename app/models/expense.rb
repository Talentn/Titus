# frozen_string_literal: true

class Expense < ApplicationRecord
  def self.monthly_stats
    select("strftime('%Y-%m', date) as month, SUM(amount) as total_amount")
      .group("strftime('%Y-%m', date)")
      .order('month DESC')
  end
end
