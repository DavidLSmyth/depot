require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:products)
		assert_response :success
		assert_select '#columns #side a', minimum: 4
		#assert_select '#column #main .entry', minimum: 3
		#assert_select '.price', /\$[,\d]+\.\d\d/
		assert_select '#columns #side #DateTime', minimum:2
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: "New Book" }
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
