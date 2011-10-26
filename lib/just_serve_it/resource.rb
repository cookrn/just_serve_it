require "mongoid"

module JustServeIt
  module Resource
    def self.included( resource_class )
      class << resource_class
        include Mongoid::Document

        field :data     , :type => Hash
        field :resource , :type => Symbol

        default_scope where( :resource => @resource )
      end
    end
  end
end

