require "test_helper"

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get name_step" do
    get form_name_step_url
    assert_response :success
  end

  test "address_step should redirect to name_step if no session" do
    get form_address_step_url
    assert_redirected_to form_name_step_path
  end

  test "payment_step should redirect to name_step if no session" do
    get form_payment_step_url
    assert_redirected_to form_name_step_path
  end

  test "redirect to address_step" do
    visit form_name_step_path
    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'van den Brand'
    fill_in 'Email', with: 'geldig@email.adr'
    click_on 'submit'
    
    assert_current_path form_address_step_path
    assert page.has_content?('Kevin')
  end

  test "alert if name form is not valid" do
    visit form_name_step_path
    fill_in 'First name', with: ''

    fill_in 'Email', with: ''
    click_on 'submit'
    assert page.has_content?('can\'t be blank')
    assert page.has_content?('vul je naam in')
  end

  test 'email uniek' do
    #let op uniek email adres in de orders factory define.
    FactoryBot.create(:order, email: 'kevin@clickhere.nl')
    visit form_name_step_path
    fill_in 'Email', with: 'kevin@clickhere.nl'
    click_on 'submit'

    assert page.has_content?('must be unique')
  end

  test 'check email format' do
    #wel email maar niet geldig format
    visit form_name_step_path

    fill_in 'Email', with: 'kevin@clickhere'
    click_on 'submit'

    assert page.has_content?('can\'t be blank')
  end

  test 'address is valid including zip code > redirect to payment step' do
    visit form_name_step_path
    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'van den Brand'
    fill_in 'Email', with: 'geldig@email.adr'
    click_on 'submit'

    assert_current_path form_address_step_path

    fill_in 'Address', with: 'Niasstraat 4'
    fill_in 'Zipcode', with: '3553XP'
    fill_in 'City', with: 'Utrecht'
    click_on 'submit'
    
    assert_current_path form_payment_step_path
    assert page.has_content?('Niasstraat')
  end

  test 'presence of address and city' do
    visit form_name_step_path
    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'van den Brand'
    fill_in 'Email', with: 'geldig@email.adr'
    click_on 'submit'

    assert_current_path form_address_step_path

    fill_in 'Address', with: ''
    fill_in 'Zipcode', with: '3553XP'
    fill_in 'City', with: 'Utrecht'
    click_on 'submit'

    assert_current_path form_address_step_path
    assert page.has_content?('can\'t be blank')
  end

  test 'payment form no consent' do
    visit form_name_step_path
    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'van den Brand'
    fill_in 'Email', with: 'geldig@email.adr'
    click_on 'submit'

    assert_current_path form_address_step_path

    fill_in 'Address', with: 'Niasstraat 4'
    fill_in 'Zipcode', with: '3553XP'
    fill_in 'City', with: 'Utrecht'
    click_on 'submit'

    assert_current_path form_payment_step_path

    #payment service? knop submit, geeft paid terug.
    # check 'order[consent]'
    click_on 'submit'
    assert_current_path form_payment_step_path

  end

  test 'payment form given consent' do
    visit form_name_step_path
    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'van den Brand'
    fill_in 'Email', with: 'geldig@email.adr'
    click_on 'submit'

    assert_current_path form_address_step_path

    fill_in 'Address', with: 'Niasstraat 4'
    fill_in 'Zipcode', with: '3553XP'
    fill_in 'City', with: 'Utrecht'
    click_on 'submit'

    assert_current_path form_payment_step_path

    #payment service? knop submit, geeft paid terug.
    check 'order[consent]'
    click_on 'submit'
    assert_current_path form_success_step_path

  end
  

end
