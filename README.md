plupload-rails3
==============

To install:

    rails plugin install git://github.com/codeodor/plupload-rails3.git


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
