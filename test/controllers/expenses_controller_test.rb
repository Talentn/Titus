require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one) # Load the fixture 'one'
    @valid_params = { name: 'New Expense', date: Date.today, description: 'Business Meeting', amount: 100.0, approved: true }
    @invalid_params = { name: '', date: nil, description: '', amount: nil, approved: false }
  end

  test "should get index" do
    get expenses_url
    assert_response :success
    assert_not_nil assigns(:expenses) # Ensure @expenses is not nil
  end

  test "should get stats" do
    get expense_stats_url
    assert_response :success
    assert_not_nil assigns(:monthly_stats) # Ensure @monthly_stats is not nil
  end

  test "should create expense with valid params" do
    assert_difference('Expense.count') do
      post expenses_url, params: { expense: @valid_params }
    end
    assert_redirected_to expenses_url
  end

  test "should not create expense with invalid params" do
    assert_no_difference('Expense.count') do
      post expenses_url, params: { expense: @invalid_params }
    end
    assert_response :unprocessable_entity
  end

  test "should show expense" do
    get expense_url(@expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_url(@expense)
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(@expense), params: { expense: { name: 'Updated Name' } }
    assert_redirected_to expenses_url
    @expense.reload
    assert_equal 'Updated Name', @expense.name
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense)
    end
    assert_redirected_to expenses_url
  end
end
