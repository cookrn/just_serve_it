require "just_serve_it/resource_class_collection"
require "renee"

module JustServeIt
  class AppBuilder
    attr_reader :rack_app
    attr_reader :resource_collection

    def initialize( *resources )
      setup_mongo
      build_rack_app
      build_resource_collection *resources
      puts JustServeIt.resource_class_collection.inspect
    end

    def build_resource_collection( *resources )
      JustServeIt.setup do | config |
        config.resource_class_collection = JustServeIt::ResourceClassCollection.new *resources
      end
    end

    def build_rack_app
      @rack_app = Renee do
        path "resources" do
          var do | resource |
            @resource_class = JustServeIt.resource_class_collection.find_by_name resource

            # RESOURCE INDEX
            get do
              halt "a #{ resource } index"
            end

            # RESOURCE CREATE
            post do
              halt "a #{ resource } create"
            end

            var do | id |
              @resource = @resource_class.find id

              # RESOURCE SHOW
              get do
                halt "a #{ @resource_class.inspect } show with id #{ id }"
              end

              # RESOURCE UPDATE
              put do
                halt "a #{ resource } update with id #{ id }"
              end

              # RESOURCE DESTROY
              delete do
                halt "a #{ resource } destroy with id #{ id }"
              end
            end
          end
        end
      end
    end

    def setup_mongo
      Mongoid.load! JustServeIt.mongoid_config
    end
  end
end

