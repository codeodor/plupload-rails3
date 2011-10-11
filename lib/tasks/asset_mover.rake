namespace :plupload_rails3 do 
  desc "Installs the plupload assets to your application"
  task :install_assets do
    require File.join(File.dirname(__FILE__), '../plupload-rails3/asset_mover')
    install_plupload_assets
  end
end

namespace :plupload_rails3 do 
  desc "Removes the installed plupload assets from your application"
  task :uninstall_assets do
    require File.join(File.dirname(__FILE__), '../plupload-rails3/asset_mover')
    uninstall_plupload_assets
  end
end