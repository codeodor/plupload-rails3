module PluploadRails3
  class Railtie < Rails::Railtie
    initializer "plupload-rails3.configure_middleware" do |app|
      app.middleware.use ActionDispatch::PluploadParamsRenamer
    end
    
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'../tasks/*.rake')].each { |f| load f }
    end
      
  end
end