begin 
  require File.join(File.dirname(__FILE__), 'lib/plupload-rails3/asset_mover')
rescue 
  #to install locally, I have to use rails runner instead of rails plugin install, and it gives a messed up path
  require File.join(Rails.root, File.dirname(__FILE__), 'lib/plupload-rails3/asset_mover')
end
install_plupload_assets
