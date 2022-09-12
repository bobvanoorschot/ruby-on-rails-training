require "application_system_test_case"

class FormTest < ApplicationSystemTestCase
  test "visiting the first step" do
    visit form_first_step_url
    assert_selector "h1", text: "First step"
  end
end