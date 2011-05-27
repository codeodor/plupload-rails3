require 'rack/utils'
 
class PluploadParamsRenamer
  def initialize(app)
    @app = app
  end
 
  def call(env)
    req = Rack::Request.new(env)
    if req.POST["_plupload_upload"]
      object, method = req.params["_plupload_upload"].split(/[\[\]]/)
      req.params[object] ||= {} 
      req.params[object][method] = req.params["file"] #req.POST[req.POST["_plupload_upload"]] = req.POST["file"]
    end 
    
    @app.call(env)
  end
end