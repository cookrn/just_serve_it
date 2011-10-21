require "just_serve_it/ext/kernel"
require "just_serve_it/app_builder"

module JustServeIt
  def self.serve( *resources )
    JustServeIt::AppBuilder.new *resources
  end
end

