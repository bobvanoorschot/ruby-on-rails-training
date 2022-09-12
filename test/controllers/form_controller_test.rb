require "test_helper"

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get name_step" do
    get form_name_step_url
    assert_response :success
  end

  test "should get address_step" do
    get form_address_step_url
    assert_response :success
  end

  test "should get payment_step" do
    get form_payment_step_url
    assert_response :success
  end
end
