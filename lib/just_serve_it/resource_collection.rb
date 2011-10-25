require "just_serve_it/resource_builder"

module JustServeIt
  class ResourceCollection
    attr_reader :resources
    attr_reader :resource_names

    def initialize( *resources )
      build_resources *resources
    end

    def build_resources( *resources )
      build_resource_names *resources
      @resources = resources.map do | resource |
        resource_builder = JustServeIt::ResourceBuilder.new resource
        resource_builder.resource
      end
    end

    def build_resource_names( *resources )
      @resource_names = resources
    end
  end
end

