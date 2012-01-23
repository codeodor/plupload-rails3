require 'fileutils'

def plupload_asset_destination
  if Rails.version < "3.1"
    dest = {  
      :img => "public/images",
      :js => "public/javascripts",
      :css => "public/stylesheets"
    } 
  else
    dest = {  
      :img => "vendor/assets/images",
      :js => "vendor/assets/javascripts",
      :css => "vendor/assets/stylesheets"
    }
  end
  return dest
end  

def install_plupload_assets  
  plupload_asset_destination.keys.each do |asset_type|
    directory = File.join(Rails.root, plupload_asset_destination[asset_type])
    puts "Making directory: #{directory}/plupload-rails3"
    FileUtils.mkdir_p(directory)
  end
  
  dest = File.join(Rails.root, plupload_asset_destination[:img])
  puts "Copying image assets to #{dest}/plupload-rails3"
  FileUtils.cp_r(File.join(File.dirname(__FILE__), '../public/images/plupload-rails3'), dest)
  
  dest = File.join(Rails.root, plupload_asset_destination[:js])
  puts "Copying javascript assets to #{dest}"
  FileUtils.cp_r(File.join(File.dirname(__FILE__), '../public/javascripts/plupload-rails3'), dest)
  
  dest = File.join(Rails.root, plupload_asset_destination[:css])
  puts "Copying stylesheet assets to #{dest}"
  FileUtils.cp_r(File.join(File.dirname(__FILE__), '../public/stylesheets/plupload-rails3'), dest)
  
  dest = File.join(Rails.root, 'tmp/plupload-rails3')
  puts "Creating tmp folder at #{dest}"
  FileUtils.mkdir(dest) unless File.exists?(dest)
end

def uninstall_plupload_assets
  plupload_asset_destination.keys.each do |asset_type|
    directory = File.join(Rails.root, plupload_asset_destination[asset_type], "plupload-rails3")
    puts "Removing directory #{directory} and its contents"
    FileUtils.rm_r(directory) if File.exists?(directory)
  end
  
  directory = File.join(Rails.root,'tmp/plupload-rails3')
  puts "Removing directory #{directory} and its contents"
  FileUtils.rm_r(directory) if File.exists?(directory)
end