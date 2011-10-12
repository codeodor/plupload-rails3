require 'plupload-rails3'

config.middleware.use(ActionDispatch::PluploadParamsRenamer)
