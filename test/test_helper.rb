# Setup Test Root const
GEM_ROOT = File.expand_path( "../.." , __FILE__ )

# Force Set our Rack ENV
ENV["RACK_ENV"] = "test"

# Setup Bundler
gemfile = File.expand_path("#{ GEM_ROOT }/Gemfile", __FILE__)
if File.exist?(gemfile)
  ENV["BUNDLE_GEMFILE"] = gemfile
  require "bundler"
  Bundler.setup
end

gem "minitest"
require "minitest/autorun"
require "rack"
require "rack/test"

require "just_serve_it"

# Load support files
Dir[ "#{ GEM_ROOT }/test/support/**/*.rb" ].each { |f| require f }
