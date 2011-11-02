class PluploadRailsController < ActionController::Base
  def _plupload_uploader
    plupload_temp_path = "tmp/plupload-rails3/#{File.basename(params[:file].tempfile.path)}"
    params[:file].tempfile.close unless params[:file].tempfile.closed?
    FileUtils.mv(params[:file].tempfile, plupload_temp_path)
    add_fields_for_files_to_forms =<<END
      function _pluploadRails_addFieldsForFilesToForms(){
        $('form').each(function() {
          var theForm = $(this);
          
          var default_input = $('<input />').attr('type', 'hidden');
          
          var input = default_input.clone()
          .attr('name', '_plupload_files[]')
          .val('#{File.expand_path(params[:file].tempfile.path)}');
          theForm.append(input);
          
          var input = default_input.clone()
          .attr('name', '_plupload_original_names[]')
          .val('#{params[:file].original_filename}');
          theForm.append(input);
          
          var input = default_input.clone()
          .attr('name', '_plupload_content_types[]')
          .val('#{params[:file].content_type}');
          theForm.append(input);
          
          var input = default_input.clone()
          .attr('name', '_plupload_upload')
          .val('#{params[:_plupload_upload]}');
          if(document.getElementsByName(input.name).length == 0) theForm.append(input);
        
        });
      }
      _pluploadRails_addFieldsForFilesToForms();
END
    render :text=>add_fields_for_files_to_forms
  end
end