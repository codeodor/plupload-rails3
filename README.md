plupload-rails3
==============

To install:

    rails plugin install git://github.com/codeodor/plupload-rails3.git


The PlUpload code in lib/app/views/plupload/_uploader_scripts.html.erb is from http://www.theroamingcoder.com/node/50, where I learned how to use Plupload with Rails.


Example
=======

In your view:

   <%= plupload(@library_file, :payload, {:params=>{:library_file=>{:title=>"some title"}}}) %>



Copyright (c) 2011 Sammy Larbi, released under the MIT license 
(with Plupload and it's components using other licenses -- see LICENSE file)
