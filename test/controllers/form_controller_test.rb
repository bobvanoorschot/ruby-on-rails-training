# frozen_string_literal: true

require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test 'should get first_step' do
    get form_first_step_url
    assert_response :success
  end

  test 'should get second_step' do
    get form_second_step_url
    assert_response :success
  end

  test 'should get third_step' do
    get form_third_step_url
    assert_response :success
  end
end
