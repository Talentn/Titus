# frozen_string_literal: true

require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one) # Assuming there's a fixture set up for an expense
  end

  # Test for Index action
  test 'should get index' do
    get expenses_url
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  # Test for Show action
  test 'should show expense' do
    get expense_url(@expense)
    assert_response :success
  end

  # Test for New action
  test 'should get new' do
    get new_expense_url
    assert_response :success
  end

  # Test for Create action (Valid case)
  test 'should create expense' do
    assert_difference('Expense.count', 1) do
      post expenses_url,
           params: { expense: { claimer: 'Ala', date: Date.today, description: 'Some description', amount: 100,
                                approved: true } }
    end
    assert_redirected_to expenses_url
  end

  # Test for Edit action
  test 'should get edit' do
    get edit_expense_url(@expense)
    assert_response :success
  end

  # Test for Update action (Valid case)
  test 'should update expense' do
    patch expense_url(@expense), params: { expense: { claimer: 'Taoufik', amount: 200 } }
    assert_redirected_to expenses_url
  end


  # Test for Destroy action
  test 'should destroy expense' do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense)
    end
    assert_redirected_to expenses_url
  end

  # Test for Stats action (Sort by amount descending)
  test 'should get stats and sort by amount descending' do
    get stats_expenses_url, params: { sort: 'desc' }
    assert_response :success
    # Check if the monthly_stats are sorted correctly
    monthly_stats = assigns(:monthly_stats)
    assert_equal(monthly_stats, monthly_stats.sort_by { |_month, total_amount| -total_amount })
  end

  # Test for Stats action (Sort by amount ascending)
  test 'should get stats and sort by amount ascending' do
    get stats_expenses_url, params: { sort: 'asc' }
    assert_response :success
    # Check if the monthly_stats are sorted correctly
    monthly_stats = assigns(:monthly_stats)
    assert_equal(monthly_stats, monthly_stats.sort_by { |_month, total_amount| total_amount })
  end
end
