require 'factory_girl'
require 'active_support/core_ext'

FactoryGirl.find_definitions

PROJECT_ROOT = File.expand_path("../..", __FILE__)

Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
  require file
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
