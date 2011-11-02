plupload-rails3
==============

[Plupload](http://www.plupload.com/) lets you upload multiple files at a time and even allows drag and drop from the local file system into the browser (with Firefox and Safari).

This plugin tries to make its integration with Rails 3 very simple.

To install as a plugin (from inside your project's directory):

    rails plugin install git://github.com/codeodor/plupload-rails3.git

To remove the plugin:

    rails plugin uninstall plupload-rails3


To install as a gem:

1. Put `gem 'plupload-rails3'` in your application's Gemfile
2. Run `bundle install` from the command line inside your application's directory
3. Run `bundle exec rake plupload_rails3:install_assets` from the command line inside your application's directory

To remove the gem from your project, remove the line in your Gemfile. You can remove the assets that got copied to your application by running `bundle exec rake plupload_rails3:uninstall_assets` from the command line inside your application's directory.

For Rails 3.1, you'll also need to tell the asset pipeline about the new assets. 

In assets/javascripts/application.js make sure your application provides URL access to the plupload scripts, CSS, and images:

    //= provide_tree ../../../vendor/assets/javascripts/plupload-rails3
    //= provide_tree ../../../vendor/assets/stylesheets/plupload-rails3
    //= provide_tree ../../../vendor/assets/images/plupload-rails3


    


To use:

    <%= plupload(model, method, options={:plupload_container=>'uploader'}) %>
    <div id="uploader" name="uploader" style="width: 100%;"></div>
   

If you are using a nested resource, model can be an array like you'd use for url_for. For example: `model = [@folder, @file]` where `@file` is the model you're interested in uploading, but it is nested under `@folder`.


Options can be:

* :params => A hash of params you want submitted with each uploaded file.
* :plupload_container => The name of the div or whatever where plupload is going to render itself. Defaults to 'uploader'
* :max_file_size => An integer indicating the number of megabytes to allow. Defaults to 10.
* :filters => An array of hashes with :title and :extension keys specifying the files to look for. Defaults to [], which will show all files. 
* :pluploader => a value of `true` indicates that you want to have the files submitted with your form instead of in individual requests. To make this work, you need to add `match 'plupload_rails/_plupload_uploader', :controller=>'plupload_rails', :action=>'_plupload_uploader', :as=>'pluploader'` to your config/routes.rb file so plupload can upload the files, and then this plugin will insert some extra form fields into your page via JavaScript. Those fields tell the middleware how to form the request parameters before they get to your controller.
* :field_name => the name of the field, which defaults to model_name[method_name]
* :runtimes => the comma delimited list of runtimes you want to use, in order of preference. Defaults to 'html5,flash,silverlight,gears,browserplus'

Example filter: 
    
    :filters=>[{:title=>'Images', :extensions=>'jpg,gif,png'},{:title=>'PDF', :extensions=>'pdf'}])


Note: Most of the plupload code in lib/app/views/plupload/_uploader_scripts.html.erb is from http://www.theroamingcoder.com/node/50, where I learned how to use Plupload with Rails.


Example 1: Uploading the files hitting the action once for each file
====================================================================

In your view:

    <%= plupload(@library_file, :payload, {:params=>{:library_file=>{:title=>"some title"}}}) %>

Also in the view, you'll need to tell it where to go:

    <div id="uploader" name="uploader" style="width: 100%;"></div>

@library_file should be your model, where :payload is the method which holds the file contents, so that when plupload uploads the files (it hits #create once for each file) it will put the uploaded file in params[:library_file][:payload] which you can then read like this in your controller:

    params[:library_file][:payload] = params[:library_file][:payload].read
    # Note: there is no need to do this with libraries that expect an instance of 
    # UplodedFile as opposed to the contents. For example, with CarrierWave, leave
    # this line out.

Then if you're storing it in the DB, you let it continue on to 

    @library_file = LibraryFile.new(params[:library_file])


Example 2: Uploading the files for a has_many relationship with accepts_nested_attributes_for
=============================================================================================
Consider the common case of an Album which has_many Photos. 

In your form for an album, you can use:

    <%= plupload(@album, :photos, options={:plupload_container=>'uploader', :pluploader=>true, :field_name=>'album[photos_attributes][][payload]'}) %>
  <div id="uploader" name="uploader" style="width: 100%;"></div>


What this does is tells the plugin to use the pluploader (which needs a route: `match 'plupload_rails/_plupload_uploader', :controller=>'plupload_rails', :action=>'_plupload_uploader', :as=>'pluploader'`) and tells it what to name the field - in this case the Album `has_many` Photos, and the method we want on photo is called `payload`.





Copyright (c) 2011 [Sammy Larbi](http://www.codeodor.com), released under the MIT license 
(with Plupload and it's components using other licenses -- see LICENSE file)
