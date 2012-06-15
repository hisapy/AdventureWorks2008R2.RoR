require 'test_helper'

class EmployeeDepartmentHistoriesControllerTest < ActionController::TestCase
  setup do
    @employee_department_history = employee_department_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_department_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_department_history" do
    assert_difference('EmployeeDepartmentHistory.count') do
      post :create, employee_department_history: @employee_department_history.attributes
    end

    assert_redirected_to employee_department_history_path(assigns(:employee_department_history))
  end

  test "should show employee_department_history" do
    get :show, id: @employee_department_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_department_history
    assert_response :success
  end

  test "should update employee_department_history" do
    put :update, id: @employee_department_history, employee_department_history: @employee_department_history.attributes
    assert_redirected_to employee_department_history_path(assigns(:employee_department_history))
  end

  test "should destroy employee_department_history" do
    assert_difference('EmployeeDepartmentHistory.count', -1) do
      delete :destroy, id: @employee_department_history
    end

    assert_redirected_to employee_department_histories_path
  end
end
