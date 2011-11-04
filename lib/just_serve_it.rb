require "active_support/core_ext/module/attribute_accessors"
require "just_serve_it/ext/kernel"
require "just_serve_it/app_builder"
require "map"

module JustServeIt
  mattr_accessor :env
  @@env = ENV[ "RACK_ENV" ] or "development"

  mattr_reader :gem_root
  @@gem_root = File.expand_path File.join( File.dirname( __FILE__ ) , "../" )

  mattr_accessor :mongoid_config
  @@mongoid_config = "#{ gem_root }/config/mongoid.yml"

  mattr_accessor :rack_app

  mattr_accessor :resources
  @@resources = Map.new

  def self.find_resource_by_name( resource )
    resource_class = resources[ resource ]
    raise "Resource #{ resource } not defined!" unless resource_class
    resource_class
  end

  def self.serve( *resources )
    JustServeIt::AppBuilder.new *resources
    rack_app
  end

  def self.setup
    yield self if block_given?
  end

  module Resources
  end
end

