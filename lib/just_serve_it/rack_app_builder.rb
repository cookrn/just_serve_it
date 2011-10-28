require "renee"

module JustServeIt
  class RackAppBuilder
    attr_reader :rack_app

    def initialize
      build_rack_app
    end

    def build_rack_app
      @rack_app = Renee do
        path "resources" do
          var do | resource |
            @resource_class = JustServeIt.find_resource_by_name resource

            get do
              halt "hi #{ resource } index"
            end

            post do
              halt "hi #{ resource } create"
            end

            var do | id |
              get do
                halt "hi #{resource} #{id} show"
              end

              put do
                halt "hi #{resource} #{id} update"
              end

              delete do
                halt "hi #{resource} #{id} destroy"
              end
            end
          end
        end
      end
    end
  end
end

