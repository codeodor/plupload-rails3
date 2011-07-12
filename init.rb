require 'plupload_rails3'

%w{ middleware helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

ActionController::Base.append_view_path File.expand_path(File.join(File.dirname(__FILE__), 'lib/app', 'views'))

ActionView::Base.send :include, PluploadHelper

config.middleware.insert_before 'ActionDispatch::ParamsParser', 'ActionDispatch::PluploadParamsRenamer'