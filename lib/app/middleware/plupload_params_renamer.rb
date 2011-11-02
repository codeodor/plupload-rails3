require 'action_dispatch/http/request'
module ActionDispatch
  class PluploadParamsRenamer
    def initialize(app)
      @app = app
    end
   
    def call(env)
      req = Rack::Request.new(env)
      form_hash = Rails.version < "3.1" ? req.POST : env['rack.request.form_hash']
      form_hash ||= {}
            
      if form_hash["_plupload_upload"]
        object, method = form_hash["_plupload_upload"].split(/[\[\]]/)
        submethod = form_hash["_plupload_upload"].split(/[\[\]]/)[-1]
        form_hash[object] ||= {} 
        if form_hash["_plupload_files"]
          form_hash[object][method] = []
          form_hash["_plupload_files"].each_with_index do |file, i|
            plupload_temp_path = "tmp/plupload-rails3/#{File.basename(file)}"
            FileUtils.mv(plupload_temp_path, file)

            original_filename = form_hash["_plupload_original_names"][i]
            content_type = form_hash["_plupload_content_types"][i]

            uploaded_file = ActionDispatch::Http::UploadedFile.new(
              :tempfile => File.new(file),
              :type => content_type,
              :head => "Content-Disposition: form-data; name=\"file\"; filename=\"#{original_filename}\"\r\nContent-Type: #{content_type}\r\n",
              :filename => original_filename
            )

            form_hash[object][method] << {submethod => uploaded_file}
          end
        else
          form_hash[object][method] = form_hash["file"] 
        end
      end 

      @app.call(env)
    end
  end
end