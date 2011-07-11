require 'action_dispatch/http/request'
module ActionDispatch
  class PluploadParamsRenamer
    def initialize(app)
      @app = app
    end
   
    def call(env)
      req =  Request.new(env)
      if req.POST["_plupload_upload"]
        object, method = req.params["_plupload_upload"].split(/[\[\]]/)
        req.params[object] ||= {} 
        req.params[object][method] = req.params["file"] #req.POST[req.POST["_plupload_upload"]] = req.POST["file"]
      end 
      
      @app.call(env)
    end
  end
end