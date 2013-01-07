# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-committed_observer/version'

Gem::Specification.new do |gem|
  gem.name          = "activerecord-committed_observer"
  gem.version       = ActiveRecord::CommittedObserver::VERSION
  gem.authors       = ["Brandon Dewitt"]
  gem.email         = ["brandonsdewitt+committed_observer@gmail.com"]
  gem.description   = %q{adding after_commit_on_create, after_commit_on_update, after_commit_on_destroy to observer in activerecord}
  gem.summary       = %q{allows module based after_commit_on* methods}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  ##
  # Dependencies
  #
  gem.add_dependency "activerecord", "> 3.0.0"

  ##
  # Development Dependencies
  #
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry-nav"
end
