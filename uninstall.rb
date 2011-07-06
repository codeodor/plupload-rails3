require 'fileutils'
FileUtils.rm_r(File.join(File.dirname(__FILE__), '../../../public/images/plupload-rails3'))
FileUtils.rm_r(File.join(File.dirname(__FILE__), '../../../public/javascripts/plupload-rails3'))
FileUtils.rm_r(File.join(File.dirname(__FILE__), '../../../public/stylesheets/plupload-rails3'))
FileUtils.rm_r(File.join(File.dirname(__FILE__),'../../../tmp/plupload-rails3'))