require "just_serve_it/rack_app_builder"
require "just_serve_it/resource_collection_builder"
require "renee"

module JustServeIt
  class AppBuilder
    attr_reader :resource_collection

    def initialize( *resources )
      setup_mongo
      build_resource_collection *resources
      build_rack_app
    end

    def build_resource_collection( *resources )
      JustServeIt::ResourceCollectionBuilder.new *resources
    end

    def build_rack_app
      JustServeIt.rack_app = JustServeIt::RackAppBuilder.new.rack_app
    end

    def setup_mongo
      Mongoid.load! JustServeIt.mongoid_config
    end
  end
end

