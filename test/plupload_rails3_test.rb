require 'test_helper'
require 'rack/mock'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/app/middleware/plupload_params_renamer'

class PluploadRails3Test < ActiveSupport::TestCase
  #include Rack::Test::Methods
  setup do
    app = lambda { |env|
          req = Rack::Request.new(env)
          [200, {'Content-Type' => 'text/plain'}, [req.params.inspect]]
        }
    @app = PluploadParamsRenamer.new(app)
  end
  
  test "should not modify params on post without _plupload_upload" do
    params = {'some_param' => 'somevalue'}
    response = Rack::MockRequest.new(@app).post('/', :params=>params)
    
    assert_equal response.body, params.inspect
  end
  
  test "should create new param based on value of _plupload_upload" do
    params = {'_plupload_upload' => 'method[object]', 'file' => 'original_value'}
    response = Rack::MockRequest.new(@app).post('/', :params=>params)
    
    assert_match /"method"=>{"object"=>"original_value"}/, response.body
  end
end

