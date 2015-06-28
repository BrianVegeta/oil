require 'test_helper'

class Admin::WallpapersControllerTest < ActionController::TestCase
  setup do
    @admin_wallpaper = admin_wallpapers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_wallpapers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_wallpaper" do
    assert_difference('Admin::Wallpaper.count') do
      post :create, admin_wallpaper: {  }
    end

    assert_redirected_to admin_wallpaper_path(assigns(:admin_wallpaper))
  end

  test "should show admin_wallpaper" do
    get :show, id: @admin_wallpaper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_wallpaper
    assert_response :success
  end

  test "should update admin_wallpaper" do
    patch :update, id: @admin_wallpaper, admin_wallpaper: {  }
    assert_redirected_to admin_wallpaper_path(assigns(:admin_wallpaper))
  end

  test "should destroy admin_wallpaper" do
    assert_difference('Admin::Wallpaper.count', -1) do
      delete :destroy, id: @admin_wallpaper
    end

    assert_redirected_to admin_wallpapers_path
  end
end
