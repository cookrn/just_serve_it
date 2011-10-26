require "just_serve_it/resource"

module JustServeIt
  class ResourceClassBuilder
    attr_reader :resource_class

    def initialize( resource )
      build_resource_class resource
    end

    def build_resource_class( resource )
      @resource_class = Class.new Object do
        include JustServeIt::Resource
      end
      @resource_class.send :include , JustServeIt::Resource
      raise @resource_class.inspect
    end
  end
end

