require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:terms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_term
    assert_difference('Term.count') do
      post :create, :term => { }
    end

    assert_redirected_to term_path(assigns(:term))
  end

  def test_should_show_term
    get :show, :id => terms(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => terms(:one).id
    assert_response :success
  end

  def test_should_update_term
    put :update, :id => terms(:one).id, :term => { }
    assert_redirected_to term_path(assigns(:term))
  end

  def test_should_destroy_term
    assert_difference('Term.count', -1) do
      delete :destroy, :id => terms(:one).id
    end

    assert_redirected_to terms_path
  end
end
