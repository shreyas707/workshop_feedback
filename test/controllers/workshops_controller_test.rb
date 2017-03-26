require 'test_helper'

class WorkshopsControllerTest < ActionController::TestCase
  setup do
    @workshop = workshops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workshop" do
    assert_difference('Workshop.count') do
      post :create, workshop: { allow_access: @workshop.allow_access, department_id: @workshop.department_id, description: @workshop.description, end_date: @workshop.end_date, start_date: @workshop.start_date, title: @workshop.title, token: @workshop.token, user_id: @workshop.user_id }
    end

    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should show workshop" do
    get :show, id: @workshop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workshop
    assert_response :success
  end

  test "should update workshop" do
    patch :update, id: @workshop, workshop: { allow_access: @workshop.allow_access, department_id: @workshop.department_id, description: @workshop.description, end_date: @workshop.end_date, start_date: @workshop.start_date, title: @workshop.title, token: @workshop.token, user_id: @workshop.user_id }
    assert_redirected_to workshop_path(assigns(:workshop))
  end

  test "should destroy workshop" do
    assert_difference('Workshop.count', -1) do
      delete :destroy, id: @workshop
    end

    assert_redirected_to workshops_path
  end
end
