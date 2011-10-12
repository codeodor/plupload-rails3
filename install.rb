asset_mover_file = File.join(File.dirname(__FILE__), 'lib/plupload-rails3/asset_mover')

if File.exists?(asset_mover_file) 
  require asset_mover_file
else #to install locally, I have to use rails runner instead of rails plugin install, and it gives a messed up path
  require File.join(Rails.root, File.dirname(__FILE__), 'lib/plupload-rails3/asset_mover')
end

install_plupload_assets
