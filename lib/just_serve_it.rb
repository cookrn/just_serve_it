require "just_serve_it/ext/kernel"
require "just_serve_it/app_builder"

module JustServeIt
  def self.serve( *resources )
    app_builder = JustServeIt::AppBuilder.new *resources
    app_builder.rack_app
  end
end

