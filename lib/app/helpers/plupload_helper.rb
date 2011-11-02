module PluploadHelper
  def plupload(model_object, model_object_method, options={})
    options[:plupload_container] ||= 'uploader'
    options[:max_file_size] ||= 10
    options[:filters] ||= []
    options[:params] ||= {}
    options[:field_name] ||= [model_object].flatten.pop.class.name.underscore.downcase + "[#{model_object_method}]"
    options[:runtimes] ||= "html5,flash,silverlight,gears,browserplus"
    render :partial => 'plupload/uploader_scripts',
      :locals => {
        :model_object => model_object, 
        :model_object_method => model_object_method, 
        :options => options
      }
  end  
end