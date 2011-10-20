require "active_support/inflector/methods"

module JustServeIt

  class Resource

    attr_reader :app

    def initialize( resource , *opts )
      build resource
      @app = ActiveSupport::Inflector.constantize( resource ).new
    end

    def build( resource )
      eval <<-___
        #{ ActiveSupport::Inflector.constantize resource } < Sinatra::Base

          get "/" do
            head 200
          end

        end
      ___
    end

  end

end

