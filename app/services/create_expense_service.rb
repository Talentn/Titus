class CreateExpenseService
    def initialize(expense_params)
      @expense_params = expense_params
    end
  
    def call
      expense = Expense.new(@expense_params)
      if expense.save
        Result.new(success: true, expense: expense)
      else
        Result.new(success: false, errors: expense.errors)
      end
    end
  end
  
  class Result
    attr_reader :success, :expense, :errors
  
    def initialize(success:, expense: nil, errors: nil)
      @success = success
      @expense = expense
      @errors = errors
    end
  
    def success?
      @success
    end
  end
  