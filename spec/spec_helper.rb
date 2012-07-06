require 'bundler'

Bundler.require

require 'chairman'

RSpec.configure do |config|
  config.before(:suite) do
    Chairman.startup
  end
end