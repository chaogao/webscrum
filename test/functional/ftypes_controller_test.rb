require 'test_helper'

class FtypesControllerTest < ActionController::TestCase
  setup do
    @ftype = ftypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ftypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ftype" do
    assert_difference('Ftype.count') do
      post :create, ftype: { catalog: @ftype.catalog, description: @ftype.description, name: @ftype.name, owner: @ftype.owner, ruler: @ftype.ruler, show: @ftype.show }
    end

    assert_redirected_to ftype_path(assigns(:ftype))
  end

  test "should show ftype" do
    get :show, id: @ftype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ftype
    assert_response :success
  end

  test "should update ftype" do
    put :update, id: @ftype, ftype: { catalog: @ftype.catalog, description: @ftype.description, name: @ftype.name, owner: @ftype.owner, ruler: @ftype.ruler, show: @ftype.show }
    assert_redirected_to ftype_path(assigns(:ftype))
  end

  test "should destroy ftype" do
    assert_difference('Ftype.count', -1) do
      delete :destroy, id: @ftype
    end

    assert_redirected_to ftypes_path
  end
end
