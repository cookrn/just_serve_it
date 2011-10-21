require "just_serve_it/resource_builder"

module JustServeIt
  class AppBuilder
    attr_reader :app

    def initialize( *resources )
      setup_mongo
      resources = build_resources *resources
    end

    def build_resources( *resources )
      resources.map! do | resource |
        builder = JustServeIt::ResourceBuilder.new resource
        builder.resource
      end
    end

    def setup_mongo
    end
  end
end

