class PluploadRailsController < ActionController::Base
  def _plupload_uploader
    plupload_temp_path = "tmp/plupload-rails3/#{File.basename(params[:file].tempfile.path)}"
    params[:file].tempfile.close unless params[:file].tempfile.closed?
    FileUtils.mv(params[:file].tempfile, plupload_temp_path)
    add_fields_for_files_to_forms =<<END
      function _pluploadRails_addFieldsForFilesToForms(){
        for(var i=0; document.forms.length; i++) {
          var theForm = document.forms[i];
          var input = document.createElement("input");
          input.name='_plupload_files[]';
          input.type='hidden';
          input.value='#{File.expand_path(params[:file].tempfile.path)}';
          theForm.appendChild(input);
          
          var input = document.createElement("input");
          input.name='_plupload_original_names[]';
          input.type='hidden';
          input.value='#{params[:file].original_filename}';
          theForm.appendChild(input);
          
          var input = document.createElement("input");
          input.name='_plupload_content_types[]';
          input.type='hidden';
          input.value='#{params[:file].content_type}';
          theForm.appendChild(input);
          
          var input = document.createElement("input");
          input.name='_plupload_upload';
          input.type='hidden';
          input.value='#{params[:_plupload_upload]}';
          if(document.getElementsByName(input.name).length == 0) theForm.appendChild(input);
        }
      }
      _pluploadRails_addFieldsForFilesToForms();
END
    render :text=>add_fields_for_files_to_forms
  end
end