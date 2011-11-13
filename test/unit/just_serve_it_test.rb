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

  def test_find_resource_by_name_raises_error_if_resource_does_not_exist
    assert_raises RuntimeError do
      JustServeIt.find_resource_by_name :bogus
    end
  end

  def test_find_resource_by_name_returns_resource_if_exists
    JustServeIt.resources.bogus = "chili pie"
    assert_equal "chili pie" , JustServeIt.find_resource_by_name( :bogus )
  end
end

