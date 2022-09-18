# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_filter '/app/channels'
  add_filter '/app/models/application_record'

  add_group 'Services', 'app/services'
  add_group 'Validators', 'app/validators'
  add_group 'Admin', 'app/admin'
end

SimpleCov.minimum_coverage 60
