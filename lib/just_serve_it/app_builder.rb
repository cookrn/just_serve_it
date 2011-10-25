require "just_serve_it/resource_collection"
require "renee"

module JustServeIt
  class AppBuilder
    attr_reader :rack_app
    attr_reader :resource_collection

    def initialize( *resources )
      setup_mongo
      build_rack_app
      build_resource_collection *resources
    end

    def build_resource_collection( *resources )
      @resource_collection = JustServeIt::ResourceCollection.new *resources
    end

    def build_rack_app
      @rack_app = Renee do
        path "resources" do
          var do | resource |
            # RESOURCE INDEX
            get do
              halt "a #{ resource } index"
            end

            # RESOURCE CREATE
            post do
              halt "a #{ resource } create"
            end

            var do | id |
              # RESOURCE SHOW
              get do
                halt "a #{ resource } show with id #{ id }"
              end

              # RESOURCE UPDATE
              post do
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
    end
  end
end

