require 'fileutils'
FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/images/plupload-rails3'), File.join(File.dirname(__FILE__), '../../../public/images'))
FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/javascripts/plupload-rails3'), File.join(File.dirname(__FILE__), '../../../public/javascripts'))
FileUtils.cp_r(File.join(File.dirname(__FILE__), 'lib/public/stylesheets/plupload-rails3'), File.join(File.dirname(__FILE__), '../../../public/stylesheets'))
FileUtils.mkdir(File.join(File.dirname(__FILE__),'../../../tmp/plupload-rails3'))