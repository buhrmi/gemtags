# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gemtags/version"

Gem::Specification.new do |s|
  s.name        = "gemtags"
  s.version     = Gemtags::VERSION
  s.authors     = ["Stefan Buhrmester"]
  s.email       = ["buhrmi@gmail.com"]
  s.homepage    = "http://github.com/buhrmi/gemtags"
  s.summary     = "Run gemtags from the command line to create a ctags file for all bundled gems."
  s.description = "Run gemtags from the command line to create a ctags file for all bundled gems."

  s.rubyforge_project = "gemtags"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "bundler"
end
