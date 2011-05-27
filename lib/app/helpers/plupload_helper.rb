module PluploadHelper
  def plupload(model_object, model_object_method, options={})
    

    render :partial=>'plupload/uploader_scripts', :locals=>{
        :model_object=>model_object, 
        :model_object_method=>model_object_method, 
        :options=>options
      }
  end  
end