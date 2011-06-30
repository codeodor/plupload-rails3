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
      if req.POST["_plupload_files"]
        req.params[object][method + "_attributes"] = []
        req.POST["_plupload_files"].each_with_index do |file, i|
          original_filename = req.POST["_plupload_original_names"][i]
          content_type = req.POST["_plupload_content_types"][i]
          
          uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile=>File.new(file), :content_type=>content_type, :filename=>original_filename)
          
          req.params[object][method + "_attributes"] << {:picture=>uploaded_file}
        end
      else
        req.params[object][method] = req.params["file"] 
      end
    end 
    
    @app.call(env)
  end
end