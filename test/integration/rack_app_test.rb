require "test_helper"

class RackAppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    @app = JustServeIt.serve :widgets
  end

  def create_resource
    resource_class = JustServeIt.find_resource_by_name @resource
    resource = resource_class.create! :data => { :foo => "bar" }
    resource
  end

  def setup
    @resource = "widgets"
  end

  def test_widgets_index
    test_resource = create_resource
    get "/resources/#{ @resource }"
    raise last_response.inspect
  end
end

