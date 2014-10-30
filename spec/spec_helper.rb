ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  config.include OauthHelpers


  config.before(:suite) do

    OmniAuth.config.test_mode = true
    
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  
  config.use_transactional_fixtures = true

  
  config.infer_base_class_for_anonymous_controllers = false
end
