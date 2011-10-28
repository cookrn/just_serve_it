require "just_serve_it/resource_class_builder"

module JustServeIt
  class ResourceCollectionBuilder
    def initialize( *resources )
      build_resource_classes *resources
    end

    def build_resource_class( resource )
      resource_class_builder = JustServeIt::ResourceClassBuilder.new resource
      JustServeIt.resources[ resource ] = resource_class_builder.resource_class
    end

    def build_resource_classes( *resources )
      resources.each { | resource | build_resource_class resource }
    end

    private

    def classify( str )
      ActiveSupport::Inflector.classify str
    end
  end
end

