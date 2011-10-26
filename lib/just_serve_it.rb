require "active_support/core_ext/module/attribute_accessors"
require "just_serve_it/ext/kernel"
require "just_serve_it/app_builder"

module JustServeIt
  mattr_accessor :env
  @@env = "development"

  mattr_reader :gem_root
  @@gem_root = File.expand_path File.join( File.dirname( __FILE__ ) , "../" )

  mattr_accessor :mongoid_config
  @@mongoid_config = "#{ gem_root }/config/mongoid.yml"

  mattr_accessor :resource_class_collection

  def self.serve( *resources )
    app_builder = JustServeIt::AppBuilder.new *resources
    app_builder.rack_app
  end

  def self.setup
    yield self
  end
end

