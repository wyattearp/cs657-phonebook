require 'test_helper'

class PhonebooksControllerTest < ActionController::TestCase
  setup do
    @phonebook = phonebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phonebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phonebook" do
    assert_difference('Phonebook.count') do
      post :create, :phonebook => @phonebook.attributes
    end

    assert_redirected_to phonebook_path(assigns(:phonebook))
  end

  test "should show phonebook" do
    get :show, :id => @phonebook.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @phonebook.to_param
    assert_response :success
  end

  test "should update phonebook" do
    put :update, :id => @phonebook.to_param, :phonebook => @phonebook.attributes
    assert_redirected_to phonebook_path(assigns(:phonebook))
  end

  test "should destroy phonebook" do
    assert_difference('Phonebook.count', -1) do
      delete :destroy, :id => @phonebook.to_param
    end

    assert_redirected_to phonebooks_path
  end
end
