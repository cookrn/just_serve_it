require "mongoid"

module JustServeIt
  class Resource
    include Mongoid::Document
    field :data     , :type => Hash
    field :resource , :type => Symbol

    def initialize( resource )
      super()
      @resource = resource
    end
  end
end

