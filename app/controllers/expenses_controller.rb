# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_claimer_list, only: [:new, :edit]

    
  def index
    @expenses = Expense.all
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def set_claimer_list
    @claimer_list = ['Ala', 'Gaetan', 'Rahma', 'Taoufik']
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: 'Expense was successfully created.'
    else
      set_claimer_list
      render :new
    end
  end


  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Expense was successfully updated'
    else
      set_claimer_list
      render :edit
    end
  end

  def stats
    sort_order = params[:sort] || 'desc'
    @monthly_stats = Expense.group_by_month(:date, format: '%B %Y').sum(:amount)
    @monthly_stats = @monthly_stats.reject { |_month, total_amount| total_amount.zero? }
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
    params.require(:expense).permit(:claimer, :date, :description, :amount, :approved)
  end  
end
