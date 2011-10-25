require "active_support/core_ext/module/attribute_accessors"
require "just_serve_it/ext/kernel"
require "just_serve_it/app_builder"

module JustServeIt
  mattr_accessor :env
  @@env = "development"

  def self.serve( *resources )
    app_builder = JustServeIt::AppBuilder.new *resources
    app_builder.rack_app
  end

  def self.setup
    yield self
  end
end

