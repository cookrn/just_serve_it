require "just_serve_it/resource_class_builder"
require "map"

module JustServeIt
  class ResourceClassCollection
    attr_reader :resource_classes

    def initialize( *resources )
      build_resource_classes *resources
    end

    def build_resource_classes( *resources )
      @resource_classes = Map.new
      resources.each do | resource |
        resource_class_builder = JustServeIt::ResourceClassBuilder.new resource
        @resource_classes[ resource ] = resource_class_builder.resource_class
      end
    end

    def find_by_name( resource )
      raise JustServeIt::ResourceNotDefined.new( "Resource with name #{ resource } was not defined!" ) unless @resource_classes.include? resource
      @resource_classes[ resource ]
    end
  end
end

