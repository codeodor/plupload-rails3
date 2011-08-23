require 'fileutils'

image_path_prefix = '../../../public'
js_path_prefix = '../../../public'
css_path_prefix = '../../../public'

FileUtils.rm_r(File.join(File.dirname(__FILE__), "#{image_path_prefix}/images/plupload-rails3"))
FileUtils.rm_r(File.join(File.dirname(__FILE__), "#{js_path_prefix}/public/javascripts/plupload-rails3"))
FileUtils.rm_r(File.join(File.dirname(__FILE__), "#{css_path_prefix}/public/stylesheets/plupload-rails3"))
FileUtils.rm_r(File.join(File.dirname(__FILE__),'../../../tmp/plupload-rails3'))