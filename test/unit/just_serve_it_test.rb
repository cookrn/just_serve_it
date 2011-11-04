require "test_helper"

class JustServeItTest < MiniTest::Unit::TestCase
  def reload_lib
    load "#{ GEM_ROOT }/lib/just_serve_it.rb"
  end

  def setup
    ENV.delete "RACK_ENV"
    reload_lib
  end

  def test_env_default_is_development
    assert_equal "development" , JustServeIt.env
  end

  def test_env_defaults_to_rack_env
    ENV["RACK_ENV"] = "test"
    reload_lib
    assert_equal "test" , JustServeIt.env
  end
end

