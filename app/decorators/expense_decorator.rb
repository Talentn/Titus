# frozen_string_literal: true

class ExpenseDecorator
  def initialize(expense)
    @expense = expense
  end

  def formatted_amount
    ActionController::Base.helpers.number_to_currency(@expense.amount, unit: '€', format: '%n %u')
  end

  def formatted_date
    @expense.date.strftime('%B %d, %Y')
  end

  def approved_status
    @expense.approved ? 'Approved' : 'Pending'
  end

  def display_claimer
    @expense.claimer.present? ? @expense.claimer.titleize : "Unknown Claimer"
  end
end
