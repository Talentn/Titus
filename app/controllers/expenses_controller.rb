# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @expenses = Expense.all
  end

  def index
    @expenses = Expense.all
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def create
    service = CreateExpenseService.new(expense_params)
    result = service.call

    if result.success?
      redirect_to expenses_path, notice: 'Expense was successfully created.'
    else
      @expense = result.expense
      flash.now[:alert] = result.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Expense was successfully updated'
    else
      render :edit
    end
  end

  def stats
    sort_order = params[:sort] || 'desc'
    @monthly_stats = Expense.group_by_month(:date, format: '%B %Y').sum(:amount)
    @monthly_stats = if sort_order == 'asc'
                       @monthly_stats.sort_by { |_month, total_amount| total_amount }
                     else
                       @monthly_stats.sort_by { |_month, total_amount| -total_amount }
                     end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: 'Expense was successfully deleted'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :date, :description, :amount, :approved)
  end
end
