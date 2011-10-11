module PluploadRails3
  class Railtie < Rails::Railtie
    initializer "plupload-rails3.configure_middleware" do |app|
      app.middleware.insert_before(ActionDispatch::ParamsParser, ActionDispatch::PluploadParamsRenamer)
    end
    
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'../tasks/*.rake')].each { |f| load f }
    end
      
  end
end