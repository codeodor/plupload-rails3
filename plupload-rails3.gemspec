# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "plupload-rails3/version"

Gem::Specification.new do |s|
  s.name        = "plupload-rails3"
  s.version     = Plupload::Rails3::VERSION
  s.authors     = ["Sammy Larbi"]
  s.email       = ["sam@codeodor.com"]
  s.homepage    = "https://github.com/codeodor/plupload-rails3"
  s.summary     = %q{Plupload lets you upload multiple files at a time and even allows drag and drop from the local file system into the browser (with Firefox and Safari). This gem/plugin tries to make its integration with Rails 3 very simple.}
  s.description = %q{}

  s.rubyforge_project = "plupload-rails3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
