require "active_support/inflector/methods"
require "just_serve_it/resource"

module JustServeIt
  class ResourceClassBuilder
    attr_reader :resource_class

    def initialize( resource )
      setup_resource_class resource
    end

    def build_resource_class( resource )
      shell_class = Class.new Object
      JustServeIt::Resources.const_set classify( resource ) , shell_class
    end

    def set_standard_resource_include
      @resource_class.send :include , JustServeIt::Resource
    end

    def setup_resource_class( resource )
      @resource_class = build_resource_class resource
      set_standard_resource_include
    end

    private

    def classify( str )
      ActiveSupport::Inflector.classify str
    end
  end
end

