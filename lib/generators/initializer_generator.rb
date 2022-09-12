# frozen_string_literal: true

class InitializerGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file 'config/initializers/initializer.rb', '# Add initialization content here'
  end
end
