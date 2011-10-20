module JustServeIt

  # Autoloads
  autoload Resource , "just_serve_it/resource"

  # Requires
  require "just_serve_it/ext/kernel"

  def self.serve( *resources )
    JustServeIt::Resource.new *resources
  end

end

