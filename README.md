plupload-rails3
==============

To install:

    rails plugin install git://github.com/codeodor/plupload-rails3.git


To use:

    <%= plupload(model, method, options={:plupload_container=>'uploader'} %>
    <div id="uploader" name="uploader" style="width: 100%;"></div>
   


Options can be:

* :params - A hash of params you want submitted with each uploaded file.
* :plupload_container - The name of the div or whatever where plupload is going to render itself. Defaults to 'uploader'
* :max_file_size - An integer indicating the number of megabytes to allow. Defaults to 10.


The PlUpload code in lib/app/views/plupload/_uploader_scripts.html.erb is from http://www.theroamingcoder.com/node/50, where I learned how to use Plupload with Rails.


Example
=======

In your view:

    <%= plupload(@library_file, :payload, {:params=>{:library_file=>{:title=>"some title"}}}) %>


@library_file should be your model, where :payload is the method which holds the file contents, so that when plupload uploads the files (it hits #create once for each file) it will put the uploaded file in params[:library_file][:payload] which you can then read like this in your controller:

    params[:library_file][:payload] = params[:library_file][:payload].read

Then if you're storing it in the DB, you let it continue on to 

    @library_file = LibraryFile.new(params[:library_file])




Copyright (c) 2011 Sammy Larbi, released under the MIT license 
(with Plupload and it's components using other licenses -- see LICENSE file)
