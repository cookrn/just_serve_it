$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "just_serve_it/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "just_serve_it"
  s.version     = JustServeIt::VERSION
  s.authors     = ["Ryan Cook"]
  s.email       = ["cookrn@gmail.com"]
  s.homepage    = "https://github.com/cookrn/just_serve_it"
  s.summary     = "Just. Serve. It."
  s.description = "Just. Serve. It."

  s.files = Dir["{lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport" , "~> 3.1.1"
  s.add_dependency "bson_ext"      , "~> 1.4"
  s.add_dependency "map"           , "~> 4.7.1"
  s.add_dependency "mongoid"       , "~> 2.3.2"
  s.add_dependency "renee"         , "~> 0.3.2"

  s.add_development_dependency "bundler"   , "> 1.0"
  s.add_development_dependency "minitest"  , "~> 2.7.0"
  s.add_development_dependency "rack-test" , "~> 0.6.1"
end

