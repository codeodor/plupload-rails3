require 'fileutils'

image_path_prefix = '../../../public'
js_path_prefix = '../../../public'
css_path_prefix = '../../../public'

FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/images/plupload-rails3'), File.join(File.dirname(__FILE__), "#{image_path_prefix}/images/plupload-rails3"))
FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/javascripts/plupload-rails3'), File.join(File.dirname(__FILE__), "#{js_path_prefix}/javascripts/plupload-rails3"))
FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/stylesheets/plupload-rails3'), File.join(File.dirname(__FILE__), "#{css_path_prefix}/stylesheets/plupload-rails3"))
FileUtils.mkdir(File.join(File.dirname(__FILE__),'../../../tmp/plupload-rails3'))