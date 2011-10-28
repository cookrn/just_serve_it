require "mongoid"

module JustServeIt
  module Resource
    def self.included( resource_class )
      resource_class.instance_eval do
        include Mongoid::Document
        field :data , :type => Hash
      end
    end
  end
end

