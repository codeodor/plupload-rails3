require "plupload-rails3/version"
require "plupload-rails3/railtie"

require 'app/helpers/plupload_helper'
require 'app/middleware/plupload_params_renamer'
require 'app/controllers/plupload_rails_controller'

%w{ middleware helpers controllers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

ActionController::Base.append_view_path File.expand_path(File.join(File.dirname(__FILE__), 'app', 'views'))

#ActionView::Base.send :include, PluploadHelper
ActionController::Base.helper(PluploadHelper)

#ActionController::Dispatcher.middleware.insert_before(ActionDispatch::ParamsParser, ActionDispatch::PluploadParamsRenamer)