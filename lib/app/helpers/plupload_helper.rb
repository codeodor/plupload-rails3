module PluploadHelper
  def plupload(model_object, model_object_method, options={})
    options[:plupload_container] ||= 'uploader'
    options[:max_file_size] ||= 10
    options[:filters] ||= [{:title=>'All Files', :extensions=>'*'}]
    render :partial=>'plupload/uploader_scripts', :locals=>{
        :model_object=>model_object, 
        :model_object_method=>model_object_method, 
        :options=>options
      }
  end  
end