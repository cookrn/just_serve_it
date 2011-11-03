require "test_helper"

class RackAppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    @app
  end

  def create_resource( custom_data = nil )
    resource_class = JustServeIt.find_resource_by_name @resource
    resource = resource_class.create! :data => create_resource_data( custom_data )
    resource
  end

  def create_resource_data( custom_data = nil )
    data = { :foo => "bar" }
    data.merge! custom_data if custom_data
    data
  end

  def setup
    @resource = "widgets"
    @app = JustServeIt.serve @resource.to_sym
  end

  def test_rack_app_index
    test_resource = create_resource
    get "/resources/#{ @resource }"
    response = JSON.parse last_response.body
    response_ids = response.map { | r | r[ "_id" ] }
    assert_includes response_ids , test_resource.id.to_s
  end

  def test_rack_app_show
    test_resource = create_resource
    get "/resources/#{ @resource }/#{ test_resource.id }"
    response = JSON.parse last_response.body
    assert_equal test_resource.id.to_s , response[ "_id" ]
  end

  def test_rack_app_create
    data = { "custom#{ rand 100 }" => "test create" }
    test_resource_data = create_resource_data data
    post "/resources/#{ @resource }" , test_resource_data
    response = JSON.parse last_response.body
    assert_includes response[ "data" ] , data.keys.first
  end

  def test_rack_app_update
    data = { "custom#{ rand 100 }" => "test update" }
    test_resource = create_resource
    put "/resources/#{ @resource }/#{ test_resource.id }" , data
    response = JSON.parse last_response.body
    assert_includes response[ "data" ] , data.keys.first
  end

  def test_rack_app_destroy
    test_resource = create_resource
    delete "/resources/#{ @resource }/#{ test_resource.id }"
    assert_equal 204 , last_response.status
  end
end

