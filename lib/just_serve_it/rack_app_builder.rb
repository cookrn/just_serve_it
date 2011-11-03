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
              resource_instances = @resource_class.all
              respond! resource_instances.to_json , 200 , { "Content-Type" => "application/json" }
            end

            post do
              resource_instance = @resource_class.create! data: request.params
              respond! resource_instance.to_json , 201 , { "Content-Type" => "application/json" }
            end

            var do | id |
              @resource_instance = @resource_class.find id
              halt :not_found unless @resource_instance

              get do
                respond! @resource_instance.to_json , 200 , { "Content-Type" => "application/json" }
              end

              put do
                @resource_instance.update_attributes! :data => @resource_instance.data.merge( request.params )
                respond! @resource_instance.to_json , 200 , { "Content-Type" => "application/json" }
              end

              delete do
                @resource_instance.destroy
                respond! { status 204 }
              end
            end
          end
        end
      end
    end
  end
end

