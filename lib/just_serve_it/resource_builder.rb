require "just_serve_it/resource"

module JustServeIt
  class ResourceBuilder
    attr_reader :resource

    def initialize( resource )
      @resource = JustServeIt::Resource.new resource
    end
  end
end

