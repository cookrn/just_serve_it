require "rack"
require "rack/commonlogger"
require "rack/urlmap"

# Set Our Root Path
::ROOT = File.dirname File.expand_path( __FILE__ )

# Boot It
require "#{ ROOT }/config/boot"

# Middlewares
use Rack::CommonLogger

require "just_serve_it"
run JustServeIt :thingies , :widgets , :foos

